import 'package:flutter/material.dart';
import '../services/download_service.dart';
import '../ads/interstitial_ad.dart';
import '../ads/banner_ad_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    InterstitialAdHelper.loadAd();
  }

  void download() async {
    if (controller.text.isEmpty) return;

    setState(() => loading = true);

    try {
      await DownloadService.downloadVideo(controller.text);
      InterstitialAdHelper.showAd();
      show("تم التحميل 🔥");
    } catch (e) {
      show("فشل التحميل ❌");
    }

    setState(() => loading = false);
  }

  void show(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SaveFast Pro")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "ضع الرابط هنا",
              ),
            ),
            const SizedBox(height: 20),
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: download,
                    child: const Text("تحميل"),
                  ),
            const Spacer(),
            const BannerAdWidget(),
          ],
        ),
      ),
    );
  }
}
