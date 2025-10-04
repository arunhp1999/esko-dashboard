import 'package:flutter/foundation.dart';
import '../models/metrics.dart';
import '../services/api_service.dart';

class MetricsProvider with ChangeNotifier {
  MetricsSummary? summary;
  bool isLoading = false;

  Future<void> loadSummary(String product) async {
    isLoading = true;
    notifyListeners();
    try {
      final json = await ApiService.fetchMetricsSummary(product);
      summary = MetricsSummary.fromJson(json);
    } catch (e) {
      print('Failed to load metrics: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
