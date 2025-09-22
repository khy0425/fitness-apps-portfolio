import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  // 실제 AdMob 광고 ID - 수익 발생!
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1075071967728463/8071566014'; // 실제 배너
    } else {
      return 'ca-app-pub-3940256099942544/2934735716'; // iOS 테스트
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1075071967728463/1378165152'; // 실제 전면
    } else {
      return 'ca-app-pub-3940256099942544/4411468910'; // iOS 테스트
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1075071967728463/3586074831'; // 실제 리워드
    } else {
      return 'ca-app-pub-3940256099942544/1712485313'; // iOS 테스트
    }
  }

  // 광고 로딩 및 표시 로직...
}