class Event {
  final String userId;
  final String product;
  final String action;
  final int duration;
  final DateTime timestamp;

  Event({
    required this.userId,
    required this.product,
    required this.action,
    required this.duration,
    required this.timestamp,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      userId: json['userId'],
      product: json['product'],
      action: json['action'],
      duration: json['duration'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
