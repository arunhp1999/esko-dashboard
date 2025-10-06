import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String get base {
    if (kIsWeb) {
      // Running in Chrome/Web
      return "http://localhost:8080/api";
    } else if (Platform.isAndroid) {
      // Running in Android Emulator
      return "http://10.0.2.2:8080/api";
    } else {
      // macOS, Windows, or iOS simulator
      return "http://localhost:8080/api";
    }
  }

  static Future<Map<String, dynamic>> fetchMetricsSummary(String product,
      {int? start, int? end}) async {
    final params = <String, String>{'product': product};
    if (start != null) params['start'] = start.toString();
    if (end != null) params['end'] = end.toString();

    final uri =
        Uri.parse('$base/metrics/summary').replace(queryParameters: params);
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load metrics: ${res.statusCode}');
    }
  }
}
