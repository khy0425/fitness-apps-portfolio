import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// Burpee Beast 전용 운동 프로그레션 데이터
/// 과학적 근거: hiit_cardio_research
class BurpeeData {

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
        1: [3, 5, 3, 3, 4],
        2: [5, 8, 5, 5, 6],
        3: [8, 12, 7, 7, 8],
      },
      2: {
        1: [10, 15, 8, 8, 10],
        2: [12, 18, 10, 10, 12],
        3: [15, 20, 12, 12, 15],
      },
      3: {
        1: [18, 25, 15, 15, 18],
        2: [22, 30, 18, 18, 22],
        3: [25, 35, 20, 20, 25],
      },
      4: {
        1: [28, 40, 25, 25, 28],
        2: [32, 45, 28, 28, 32],
        3: [35, 50, 30, 30, 35],
      },
      5: {
        1: [40, 55, 35, 35, 40],
        2: [45, 60, 40, 40, 45],
        3: [50, 65, 45, 45, 50],
      },
      6: {
        1: [55, 75, 50, 50, 55],
        2: [60, 80, 55, 55, 60],
        3: [70, 90, 65, 65, 70],
      },
    },
  };

  /// 레벨별 목표
  static Map<UserLevel, String> get goals => {
    UserLevel.rookie: '100개 버피 (초보자)',
    UserLevel.rising: '100개 버피 (중급자)',
    UserLevel.alpha: '100개 버피 (상급자)',
    UserLevel.giga: '100개 버피 (전문가)',
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
