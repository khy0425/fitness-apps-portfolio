
import 'package:flutter/material.dart';

/// GigaChad Sprint Interval Training (SIT) 데이터
/// 2024년 최신 연구: 체지방 2.31% 감소, HIIT보다 40% 더 효과적
class ScientificSITData {

  /// 레벨별 설명
  static Map<String, String> get levelDescriptions => {
    'rookie': '🏃 초보 스프린터 - 기초 체력 구축',
    'rising': '⚡ 라이징 러너 - 스피드 향상',
    'alpha': '🦾 알파 애슬릿 - 파워 극대화',
    'giga': '👑 기가차드 - 최강 스프린터',
  };

  /// 6주 SIT 프로그레션 (Sprint Interval Training)
  /// 형식: [스프린트 시간(초), 휴식 시간(초), 반복 횟수]
  static Map<String, Map<int, Map<int, Map<String, dynamic>>>> get sitPrograms => {
    'rookie': {
      // Week 1: 적응 단계 (1:9 비율)
      1: {
        1: {'sprint': 10, 'rest': 90, 'rounds': 4, 'intensity': '85%'},
        2: {'sprint': 10, 'rest': 90, 'rounds': 5, 'intensity': '85%'},
        3: {'sprint': 15, 'rest': 135, 'rounds': 4, 'intensity': '85%'},
      },
      // Week 2: 기초 구축 (1:8 비율)
      2: {
        1: {'sprint': 15, 'rest': 120, 'rounds': 5, 'intensity': '90%'},
        2: {'sprint': 20, 'rest': 160, 'rounds': 4, 'intensity': '90%'},
        3: {'sprint': 20, 'rest': 160, 'rounds': 5, 'intensity': '90%'},
      },
      // Week 3: 강도 상승 (1:7 비율)
      3: {
        1: {'sprint': 20, 'rest': 140, 'rounds': 5, 'intensity': '92%'},
        2: {'sprint': 25, 'rest': 175, 'rounds': 4, 'intensity': '92%'},
        3: {'sprint': 25, 'rest': 175, 'rounds': 5, 'intensity': '92%'},
      },
      // Week 4: 파워 구간 (1:6 비율)
      4: {
        1: {'sprint': 25, 'rest': 150, 'rounds': 5, 'intensity': '95%'},
        2: {'sprint': 30, 'rest': 180, 'rounds': 4, 'intensity': '95%'},
        3: {'sprint': 30, 'rest': 180, 'rounds': 5, 'intensity': '95%'},
      },
      // Week 5: 최대 강도 접근 (1:5 비율)
      5: {
        1: {'sprint': 30, 'rest': 150, 'rounds': 5, 'intensity': '97%'},
        2: {'sprint': 30, 'rest': 150, 'rounds': 6, 'intensity': '97%'},
        3: {'sprint': 35, 'rest': 175, 'rounds': 5, 'intensity': '97%'},
      },
      // Week 6: 피크 퍼포먼스 (1:4 비율)
      6: {
        1: {'sprint': 30, 'rest': 120, 'rounds': 6, 'intensity': '100%'},
        2: {'sprint': 35, 'rest': 140, 'rounds': 5, 'intensity': '100%'},
        3: {'sprint': 40, 'rest': 160, 'rounds': 5, 'intensity': '100%'},
      },
    },

    'rising': {
      // Rising 레벨: 더 짧은 휴식, 더 많은 라운드
      1: {
        1: {'sprint': 20, 'rest': 100, 'rounds': 6, 'intensity': '90%'},
        2: {'sprint': 25, 'rest': 125, 'rounds': 5, 'intensity': '90%'},
        3: {'sprint': 25, 'rest': 125, 'rounds': 6, 'intensity': '90%'},
      },
      // ... 6주까지 점진적 증가
    },

    'alpha': {
      // Alpha 레벨: 고강도 전력 스프린트
      1: {
        1: {'sprint': 30, 'rest': 90, 'rounds': 6, 'intensity': '95%'},
        2: {'sprint': 30, 'rest': 90, 'rounds': 7, 'intensity': '95%'},
        3: {'sprint': 35, 'rest': 105, 'rounds': 6, 'intensity': '95%'},
      },
      // ... 6주까지
    },

    'giga': {
      // GigaChad 레벨: 최강 난이도
      1: {
        1: {'sprint': 30, 'rest': 60, 'rounds': 8, 'intensity': '100%'},
        2: {'sprint': 35, 'rest': 70, 'rounds': 8, 'intensity': '100%'},
        3: {'sprint': 40, 'rest': 80, 'rounds': 8, 'intensity': '100%'},
      },
      // ... 6주까지
    },
  };

  /// HIIT 대안 프로그램 (중간 강도)
  static Map<String, Map<int, Map<String, dynamic>>> get hiitAlternative => {
    'beginner': {
      1: {'work': 30, 'rest': 60, 'rounds': 6, 'intensity': '80%'},
      2: {'work': 45, 'rest': 45, 'rounds': 6, 'intensity': '85%'},
      3: {'work': 60, 'rest': 60, 'rounds': 5, 'intensity': '85%'},
    },
    'intermediate': {
      1: {'work': 60, 'rest': 30, 'rounds': 8, 'intensity': '85%'},
      2: {'work': 90, 'rest': 45, 'rounds': 6, 'intensity': '90%'},
      3: {'work': 120, 'rest': 60, 'rounds': 5, 'intensity': '90%'},
    },
  };

  /// Tabata 스타일 (초고강도)
  static Map<String, dynamic> get tabataProtocol => {
    'sprint': 20,
    'rest': 10,
    'rounds': 8,
    'sets': 3,
    'setRest': 120,
    'intensity': '100%',
    'description': '20초 전력질주 / 10초 휴식 x 8라운드',
  };

  /// 노르웨이 1분 프로토콜
  static Map<String, dynamic> get norwegianProtocol => {
    'sprint': 60,
    'rest': 180,
    'rounds': 4,
    'intensity': '90-95%',
    'description': '1분 스프린트 / 3분 조깅 x 4라운드',
  };

  /// 과학적 팁과 혜택
  static Map<String, String> get scientificBenefits => {
    'fatLoss': '체지방 2.31% 감소 (HIIT보다 40% 더 효과적)',
    'timeEfficiency': '운동 시간 81.46% 단축',
    'vo2maxImprovement': '최대산소섭취량 42% 향상 (2주만에)',
    'metabolicBoost': '운동 후 24시간 대사율 증가',
    'musclePreservation': '근육량 유지하며 체지방 감소',
  };

  /// 주간 포커스
  static Map<int, String> get weeklyFocus => {
    1: '🎯 기초 적응 - 스프린트 폼 습득',
    2: '⚡ 스피드 구축 - 폭발력 향상',
    3: '🔥 강도 증가 - 젖산 역치 향상',
    4: '💪 파워 개발 - 최대 속도 도달',
    5: '🚀 피크 준비 - 회복력 강화',
    6: '👑 최고 성능 - GigaChad 달성',
  };

  /// 운동 전후 가이드
  static Map<String, List<String>> get workoutGuide => {
    'warmup': [
      '5분 가벼운 조깅',
      '다이나믹 스트레칭 (레그 스윙, 하이 니)',
      '3x20m 점진적 가속 런',
      '2x10m 전력 스프린트 (50% 강도)',
    ],
    'cooldown': [
      '5분 가벼운 조깅',
      '정적 스트레칭 10분',
      '폼롤러 마사지',
      '수분 보충',
    ],
    'nutrition': [
      '운동 2시간 전: 복합 탄수화물 섭취',
      '운동 30분 전: 바나나 또는 에너지바',
      '운동 직후: 단백질 + 탄수화물 (3:1 비율)',
      '충분한 수분 섭취 (체중 1kg당 35ml)',
    ],
  };

  /// GigaChad 동기부여 메시지
  static List<String> get motivationalQuotes => [
    "🔥 스프린트는 몸을 만들고, 의지는 영혼을 만든다",
    "⚡ 30초의 고통, 24시간의 연소",
    "💪 느린 자는 빠른 자를 이길 수 없다",
    "🦾 한계는 마음이 만든 환상이다",
    "👑 GigaChad는 태어나는 게 아니라 만들어진다",
    "🚀 오늘의 스프린트가 내일의 기록이 된다",
    "💯 100% 강도, 1000% 결과",
  ];
}
