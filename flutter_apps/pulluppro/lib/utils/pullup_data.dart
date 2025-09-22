import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// Pull-up Pro 전용 운동 프로그레션 데이터
/// 과학적 근거: upper_body_strength_research
class PullupData {

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
        1: [1, 2, 1, 1, 2],
        2: [2, 3, 2, 2, 3],
        3: [3, 5, 3, 3, 4],
      },
      2: {
        1: [4, 6, 4, 4, 5],
        2: [5, 7, 5, 5, 6],
        3: [6, 8, 6, 6, 7],
      },
      3: {
        1: [7, 10, 7, 7, 8],
        2: [8, 12, 8, 8, 10],
        3: [10, 14, 10, 10, 12],
      },
      4: {
        1: [12, 16, 12, 12, 14],
        2: [14, 18, 14, 14, 16],
        3: [16, 20, 16, 16, 18],
      },
      5: {
        1: [18, 24, 18, 18, 20],
        2: [20, 26, 20, 20, 22],
        3: [22, 28, 22, 22, 24],
      },
      6: {
        1: [25, 32, 25, 25, 27],
        2: [28, 35, 28, 28, 30],
        3: [30, 40, 30, 30, 35],
      },
    },
  };

  /// 레벨별 목표
  static Map<UserLevel, String> get goals => {
    UserLevel.rookie: '50개 턱걸이 (초보자)',
    UserLevel.rising: '50개 턱걸이 (중급자)',
    UserLevel.alpha: '50개 턱걸이 (상급자)',
    UserLevel.giga: '50개 턱걸이 (전문가)',
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
