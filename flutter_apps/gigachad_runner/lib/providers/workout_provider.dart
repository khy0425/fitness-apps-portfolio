import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/workout_data.dart';
import '../models/chad_level.dart';
import '../models/route_point.dart';
import '../services/gps_service.dart';
import '../services/vibration_service.dart';
import '../services/ad_service.dart';

class WorkoutProvider with ChangeNotifier {
  final GPSService _gpsService = GPSService();

  bool _isRunning = false;
  int _seconds = 0;
  double _distance = 0.0;
  double _speed = 0.0;
  ChadLevel _currentChadLevel = ChadLevel.levels[ChadLevelType.betaPace]!;
  Timer? _timer;
  final List<RoutePoint> _routePoints = [];
  Position? _currentPosition;

  // Chad Boost 기능
  bool _isChadBoostActive = false;
  DateTime? _chadBoostEndTime;

  // Getters
  bool get isRunning => _isRunning;
  int get seconds => _seconds;
  double get distance => _distance;
  double get speed => _speed;
  ChadLevel get currentChadLevel => _currentChadLevel;
  List<RoutePoint> get routePoints => _routePoints;
  Position? get currentPosition => _currentPosition;
  bool get isChadBoostActive => _isChadBoostActive;
  DateTime? get chadBoostEndTime => _chadBoostEndTime;

  String get formattedTime {
    int hours = _seconds ~/ 3600;
    int minutes = (_seconds % 3600) ~/ 60;
    int secs = _seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String get formattedPace {
    if (_speed <= 0 || _seconds < 10) return '0:00';

    double paceMinutesPerKm = 60 / _speed;
    int minutes = paceMinutesPerKm.floor();
    int seconds = ((paceMinutesPerKm - minutes) * 60).round();

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  Future<bool> startWorkout() async {
    final started = await _gpsService.startTracking(
      onPositionUpdate: _onPositionUpdate,
    );

    if (started) {
      _isRunning = true;
      _startTimer();
      await VibrationService.startVibration();
      notifyListeners();
      return true;
    }
    return false;
  }

  void stopWorkout() {
    _isRunning = false;
    _gpsService.stopTracking();
    _timer?.cancel();
    VibrationService.stopVibration();

    // 운동 완료시 전면 광고 표시 (3분 이상 운동시)
    if (_seconds > 180) {
      AdService().showInterstitialAd();
    }

    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isRunning) {
        _seconds++;
        notifyListeners();
      }
    });
  }

  void _onPositionUpdate(Position position) {
    if (!_isRunning) return;

    _currentPosition = position;

    final previousPosition = _gpsService.previousPosition;
    if (previousPosition != null) {
      double newDistance = _gpsService.calculateDistance(
        previousPosition,
        position,
      );
      _distance += newDistance / 1000; // 미터를 킬로미터로 변환
    }

    // 속도 계산 (km/h)
    if (_seconds > 0) {
      _speed = _distance / (_seconds / 3600);
    }

    // Chad 레벨 판정
    _updateChadLevel();

    // 현재 속도와 페이스로 RoutePoint 생성
    double currentPace = _speed > 0 ? 60 / _speed : 0;
    RoutePoint routePoint = RoutePoint(
      position: position,
      speed: _speed,
      pace: currentPace,
      chadLevel: _currentChadLevel,
      timestamp: DateTime.now(),
    );

    _routePoints.add(routePoint);
    notifyListeners();
  }

  void _updateChadLevel() {
    double paceMinutesPerKm = _speed > 0 ? 60 / _speed : 0;
    final newLevel = ChadLevel.getChadLevelByPace(paceMinutesPerKm);

    if (newLevel.type != _currentChadLevel.type) {
      _currentChadLevel = newLevel;
      if (newLevel.vibrationCount > 0) {
        VibrationService.levelUpVibration();
      }
    }
  }

  WorkoutData getCurrentWorkoutData() {
    return WorkoutData(
      distance: _distance,
      speed: _speed,
      duration: _seconds,
      chadLevel: _currentChadLevel.name,
      startTime: DateTime.now().subtract(Duration(seconds: _seconds)),
    );
  }

  void resetWorkout() {
    _seconds = 0;
    _distance = 0.0;
    _speed = 0.0;
    _currentChadLevel = ChadLevel.levels[ChadLevelType.betaPace]!;
    _routePoints.clear();
    _currentPosition = null;
    notifyListeners();
  }

  // Chad Boost 기능
  void activateChadBoost({int minutes = 30}) {
    _isChadBoostActive = true;
    _chadBoostEndTime = DateTime.now().add(Duration(minutes: minutes));

    // Chad 레벨을 한 단계 상승
    ChadLevelType currentType = _currentChadLevel.type;
    ChadLevelType boostedType;

    switch (currentType) {
      case ChadLevelType.betaPace:
        boostedType = ChadLevelType.risingChad;
        break;
      case ChadLevelType.risingChad:
        boostedType = ChadLevelType.alphaChad;
        break;
      case ChadLevelType.alphaChad:
        boostedType = ChadLevelType.sigmaChad;
        break;
      case ChadLevelType.sigmaChad:
        boostedType = ChadLevelType.ultraChad;
        break;
      case ChadLevelType.ultraChad:
        boostedType = ChadLevelType.ultraChad; // 최고 레벨 유지
        break;
      case ChadLevelType.alphaPace:
        boostedType = ChadLevelType.sigmaPace;
        break;
      case ChadLevelType.sigmaPace:
        boostedType = ChadLevelType.ultraPace;
        break;
      case ChadLevelType.ultraPace:
        boostedType = ChadLevelType.ultraPace; // 최고 레벨 유지
        break;
    }

    _currentChadLevel = ChadLevel.levels[boostedType]!;
    notifyListeners();

    // 부스트 시간 체크 타이머 시작
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (!_isChadBoostActive || DateTime.now().isAfter(_chadBoostEndTime!)) {
        _deactivateChadBoost();
        timer.cancel();
      }
    });
  }

  void _deactivateChadBoost() {
    _isChadBoostActive = false;
    _chadBoostEndTime = null;

    // 원래 Chad 레벨로 복구 (현재 속도 기준)
    _updateChadLevel();
    notifyListeners();
  }

  String get chadBoostTimeRemaining {
    if (!_isChadBoostActive || _chadBoostEndTime == null) return '';

    final remaining = _chadBoostEndTime!.difference(DateTime.now());
    if (remaining.isNegative) return '';

    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _gpsService.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
