import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdHelper {
  static InterstitialAd? ad;

  static void loadAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-8647572192042201/6789019258",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (a) => ad = a,
        onAdFailedToLoad: (_) => ad = null,
      ),
    );
  }

  static void showAd() {
    if (ad != null) {
      ad!.show();
      ad = null;
      loadAd();
    }
  }
}
