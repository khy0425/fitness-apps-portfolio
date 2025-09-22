import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../providers/workout_provider.dart';
import '../utils/app_colors.dart';
import '../models/route_point.dart';
import '../models/chad_level.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  GoogleMapController? _mapController;

  void _animateToPosition(Position position) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 17.0,
          bearing: 0,
          tilt: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '달리기',
          style: GoogleFonts.bebasNeue(fontSize: 28, color: AppColors.chadGold),
        ),
        centerTitle: true,
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, provider, child) {
          // 운동 중이고 위치가 업데이트되면 카메라 이동
          if (provider.isRunning && provider.currentPosition != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _animateToPosition(provider.currentPosition!);
            });
          }

          return Stack(
            children: [
              // 지도 배경
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                  // 사용자 위치 추적 모드
                  if (provider.currentPosition != null) {
                    _animateToPosition(provider.currentPosition!);
                  }
                },
                initialCameraPosition: CameraPosition(
                  target: provider.currentPosition != null
                      ? LatLng(
                          provider.currentPosition!.latitude,
                          provider.currentPosition!.longitude,
                        )
                      : const LatLng(37.5665, 126.9780), // 서울 기본 위치
                  zoom: 16.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                polylines: _buildPaceColoredPolylines(provider.routePoints),
                markers: {
                  if (provider.currentPosition != null)
                    Marker(
                      markerId: const MarkerId('current'),
                      position: LatLng(
                        provider.currentPosition!.latitude,
                        provider.currentPosition!.longitude,
                      ),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueYellow,
                      ),
                    ),
                },
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                rotateGesturesEnabled: false,
              ),

              // 상단 정보 패널
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.pureBlack,
                        AppColors.pureBlack.withValues(alpha: 0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        // 시간과 Chad 레벨
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              provider.formattedTime,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 42,
                                color: AppColors.chadGold,
                                shadows: [
                                  Shadow(
                                    color: AppColors.pureBlack,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: provider.currentChadLevel.color.withValues(alpha: 0.9),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: provider.currentChadLevel.color,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                provider.currentChadLevel.name,
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 16,
                                  color: AppColors.pureBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // 통계 카드들
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildCompactStatCard(
                              '거리',
                              '${provider.distance.toStringAsFixed(2)}km',
                            ),
                            _buildCompactStatCard(
                              '속도',
                              '${provider.speed.toStringAsFixed(1)}km/h',
                            ),
                            _buildCompactStatCard(
                              '페이스',
                              provider.formattedPace,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 페이스 레전드 (우측 상단)
              Positioned(
                top: 90,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.pureBlack.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.chadGold.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '페이스 구간',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...ChadLevel.levels.values.map((level) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 16,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: level.color,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                level.name,
                                style: GoogleFonts.robotoCondensed(
                                  fontSize: 10,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 하단 컨트롤 패널
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.pureBlack,
                        AppColors.pureBlack.withValues(alpha: 0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 시작/정지 버튼
                        ElevatedButton(
                          onPressed: () async {
                            if (provider.isRunning) {
                              provider.stopWorkout();
                            } else {
                              final started = await provider.startWorkout();
                              if (!started) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('GPS를 켜주시거나 위치 권한을 허용해주세요!'),
                                      backgroundColor: AppColors.cardBackground,
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: provider.isRunning
                                ? AppColors.errorRed
                                : AppColors.chadGold,
                            foregroundColor: provider.isRunning
                                ? AppColors.textSecondary
                                : AppColors.textOnGold,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                          ),
                          child: Text(
                            provider.isRunning ? '정지' : '시작',
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // 리셋 버튼
                        if (!provider.isRunning && provider.seconds > 0)
                          TextButton(
                            onPressed: provider.resetWorkout,
                            child: Text(
                              '리셋',
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Set<Polyline> _buildPaceColoredPolylines(List<RoutePoint> routePoints) {
    if (routePoints.length < 2) return {};

    Set<Polyline> polylines = {};

    // 연속된 같은 Chad 레벨 포인트들을 그룹화
    List<List<RoutePoint>> segments = [];
    List<RoutePoint> currentSegment = [routePoints[0]];

    for (int i = 1; i < routePoints.length; i++) {
      if (routePoints[i].chadLevel.type == currentSegment.last.chadLevel.type) {
        currentSegment.add(routePoints[i]);
      } else {
        // 새로운 Chad 레벨이므로 현재 세그먼트를 완료하고 새로 시작
        segments.add(currentSegment);
        currentSegment = [routePoints[i-1], routePoints[i]]; // 연결성을 위해 이전 포인트 포함
      }
    }

    // 마지막 세그먼트 추가
    if (currentSegment.isNotEmpty) {
      segments.add(currentSegment);
    }

    // 각 세그먼트별로 polyline 생성
    for (int i = 0; i < segments.length; i++) {
      List<RoutePoint> segment = segments[i];
      if (segment.length >= 2) {
        polylines.add(
          Polyline(
            polylineId: PolylineId('segment_$i'),
            points: segment
                .map((point) => LatLng(point.latitude, point.longitude))
                .toList(),
            color: segment.first.color,
            width: 6,
            patterns: [],
          ),
        );
      }
    }

    return polylines;
  }

  Widget _buildCompactStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.pureBlack.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.chadGold.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.robotoCondensed(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: GoogleFonts.bebasNeue(
              fontSize: 16,
              color: AppColors.chadGold,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: AppColors.pureBlack,
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
