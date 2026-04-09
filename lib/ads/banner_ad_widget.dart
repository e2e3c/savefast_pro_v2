import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? ad;
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    ad = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-8647572192042201/4629963034",
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => loaded = true),
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? SizedBox(
            height: ad!.size.height.toDouble(),
            width: ad!.size.width.toDouble(),
            child: AdWidget(ad: ad!),
          )
        : const SizedBox();
  }
}
