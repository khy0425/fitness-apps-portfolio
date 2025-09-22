import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

enum ChadLevelType { betaPace, risingChad, alphaChad, sigmaChad, ultraChad, alphaPace, sigmaPace, ultraPace }

class ChadLevel {
  final ChadLevelType type;
  final String name;
  final Color color;
  final double maxPaceMinutesPerKm;
  final int vibrationCount;

  const ChadLevel({
    required this.type,
    required this.name,
    required this.color,
    required this.maxPaceMinutesPerKm,
    required this.vibrationCount,
  });

  static const Map<ChadLevelType, ChadLevel> levels = {
    ChadLevelType.ultraChad: ChadLevel(
      type: ChadLevelType.ultraChad,
      name: "Ultra Chad",
      color: AppColors.ultraChad, // 브라이트 골드
      maxPaceMinutesPerKm: 5.0,
      vibrationCount: 1,
    ),
    ChadLevelType.sigmaChad: ChadLevel(
      type: ChadLevelType.sigmaChad,
      name: "Sigma Chad",
      color: AppColors.sigmaChad, // 골든로드
      maxPaceMinutesPerKm: 6.0,
      vibrationCount: 0,
    ),
    ChadLevelType.alphaChad: ChadLevel(
      type: ChadLevelType.alphaChad,
      name: "Alpha Chad",
      color: AppColors.alphaChad, // 다크 골든로드
      maxPaceMinutesPerKm: 7.0,
      vibrationCount: 0,
    ),
    ChadLevelType.risingChad: ChadLevel(
      type: ChadLevelType.risingChad,
      name: "Rising Chad",
      color: AppColors.risingChad, // 오렌지 골드
      maxPaceMinutesPerKm: 8.0,
      vibrationCount: 0,
    ),
    ChadLevelType.betaPace: ChadLevel(
      type: ChadLevelType.betaPace,
      name: "Beta Pace",
      color: AppColors.betaPace, // 어두운 회색
      maxPaceMinutesPerKm: double.infinity,
      vibrationCount: 0,
    ),
    ChadLevelType.alphaPace: ChadLevel(
      type: ChadLevelType.alphaPace,
      name: "Alpha Pace",
      color: AppColors.alphaChad,
      maxPaceMinutesPerKm: 6.5,
      vibrationCount: 0,
    ),
    ChadLevelType.sigmaPace: ChadLevel(
      type: ChadLevelType.sigmaPace,
      name: "Sigma Pace",
      color: AppColors.sigmaChad,
      maxPaceMinutesPerKm: 5.5,
      vibrationCount: 0,
    ),
    ChadLevelType.ultraPace: ChadLevel(
      type: ChadLevelType.ultraPace,
      name: "Ultra Pace",
      color: AppColors.ultraChad,
      maxPaceMinutesPerKm: 4.5,
      vibrationCount: 1,
    ),
  };

  static ChadLevel getChadLevelByPace(double paceMinutesPerKm) {
    for (final level in levels.values) {
      if (paceMinutesPerKm <= level.maxPaceMinutesPerKm) {
        return level;
      }
    }
    return levels[ChadLevelType.betaPace]!;
  }
}
