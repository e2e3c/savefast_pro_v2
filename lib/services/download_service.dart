import 'dart:convert';
import 'package:http/http.dart' as http;

class DownloadService {
  static Future<void> downloadVideo(String url) async {
    final response = await http.post(
      Uri.parse("https://savefast-api-szkc.onrender.com/download"),
      body: {"url": url},
    );

    if (response.statusCode != 200) {
      throw Exception("error");
    }

    final data = jsonDecode(response.body);
    print(data);
  }
}
