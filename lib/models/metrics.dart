class MetricsSummary {
  final String product;
  final double totalActiveMinutes;
  final double totalIdleMinutes;
  final double idlePercentage;
  final String? mostUsedFeature;
  final Map<String, int> topFeatures;

  MetricsSummary({
    required this.product,
    required this.totalActiveMinutes,
    required this.totalIdleMinutes,
    required this.idlePercentage,
    required this.mostUsedFeature,
    required this.topFeatures,
  });

  factory MetricsSummary.fromJson(Map<String, dynamic> json) {
    final rawMap = (json['topFeatures'] ?? {}) as Map<String, dynamic>;
    final topFeatures = rawMap.map((k, v) => MapEntry(k, (v as num).toInt()));
    return MetricsSummary(
      product: json['product'] ?? '',
      totalActiveMinutes:
          (json['totalActiveMinutes'] as num?)?.toDouble() ?? 0.0,
      totalIdleMinutes: (json['totalIdleMinutes'] as num?)?.toDouble() ?? 0.0,
      idlePercentage: (json['idlePercentage'] as num?)?.toDouble() ?? 0.0,
      mostUsedFeature: json['mostUsedFeature'] as String?,
      topFeatures: topFeatures,
    );
  }
}
