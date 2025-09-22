enum UserLevel { rookie, rising, alpha, giga }

class UserProfile {
  final String name;
  final UserLevel level;
  final int currentWeek;
  final int currentDay;
  final Map<String, dynamic> stats;

  UserProfile({
    required this.name,
    required this.level,
    required this.currentWeek,
    required this.currentDay,
    required this.stats,
  });

  UserProfile copyWith({
    String? name,
    UserLevel? level,
    int? currentWeek,
    int? currentDay,
    Map<String, dynamic>? stats,
  }) {
    return UserProfile(
      name: name ?? this.name,
      level: level ?? this.level,
      currentWeek: currentWeek ?? this.currentWeek,
      currentDay: currentDay ?? this.currentDay,
      stats: stats ?? this.stats,
    );
  }
}