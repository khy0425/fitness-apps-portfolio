import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// Plank Champion 전용 운동 프로그레션 데이터
/// 과학적 근거: core_strength_research
class PlankData {

  /// 레벨별 설명
  static Map<UserLevel, String> get levelDescriptions => {
    UserLevel.rookie: '초보자 - 기본기 습득',
    UserLevel.rising: '중급자 - 실력 향상',
    UserLevel.alpha: '상급자 - 고급 기술',
    UserLevel.giga: '전문가 - 마스터 레벨',
  };

  /// 6주 프로그레션 프로그램
  static Map<UserLevel, Map<int, Map<int, List<int>>>> get progressionPrograms => {
    UserLevel.rookie: {
      1: {
        1: [15, 20, 15, 15, 18],
        2: [20, 25, 18, 18, 22],
        3: [25, 30, 20, 20, 25],
      },
      2: {
        1: [30, 40, 25, 25, 30],
        2: [35, 45, 30, 30, 35],
        3: [40, 50, 35, 35, 40],
      },
      3: {
        1: [45, 60, 40, 40, 45],
        2: [50, 65, 45, 45, 50],
        3: [60, 75, 50, 50, 60],
      },
      4: {
        1: [65, 85, 60, 60, 65],
        2: [75, 95, 70, 70, 75],
        3: [85, 105, 80, 80, 85],
      },
      5: {
        1: [95, 120, 90, 90, 95],
        2: [105, 135, 100, 100, 105],
        3: [120, 150, 110, 110, 120],
      },
      6: {
        1: [135, 180, 130, 130, 135],
        2: [150, 200, 145, 145, 150],
        3: [180, 240, 170, 170, 180],
      },
    },
  };

  /// 레벨별 목표
  static Map<UserLevel, String> get goals => {
    UserLevel.rookie: '5분 플랭크 (초보자)',
    UserLevel.rising: '5분 플랭크 (중급자)',
    UserLevel.alpha: '5분 플랭크 (상급자)',
    UserLevel.giga: '5분 플랭크 (전문가)',
  };

  /// 휴식 시간 (초)
  static Map<UserLevel, int> get restTimeSeconds => {
    UserLevel.rookie: 90,
    UserLevel.rising: 75,
    UserLevel.alpha: 60,
    UserLevel.giga: 45,
  };

  /// 주간 포커스
  static Map<int, String> get weeklyFocus => {
    1: '기본기 다지기',
    2: '자세 안정화',
    3: '볼륨 증가',
    4: '강도 상승',
    5: '고강도 적응',
    6: '최대 성능',
  };
}
