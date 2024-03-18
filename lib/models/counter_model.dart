class CounterModel {
  final int value;
  final DateTime timestamp;
  final String action;
  final String? userId;
  final Map<String, dynamic>? metadata;
  
  const CounterModel({
    required this.value,
    required this.timestamp,
    required this.action,
    this.userId,
    this.metadata,
  });
  
  CounterModel copyWith({
    int? value,
    DateTime? timestamp,
    String? action,
    String? userId,
    Map<String, dynamic>? metadata,
  }) {
    return CounterModel(
      value: value ?? this.value,
      timestamp: timestamp ?? this.timestamp,
      action: action ?? this.action,
      userId: userId ?? this.userId,
      metadata: metadata ?? this.metadata,
    );
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterModel &&
        other.value == value &&
        other.timestamp == timestamp &&
        other.action == action &&
        other.userId == userId;
  }
  
  @override
  int get hashCode => value.hashCode ^ timestamp.hashCode ^ action.hashCode ^ userId.hashCode;
  
  @override
  String toString() => 'CounterModel(value: $value, timestamp: $timestamp, action: $action, userId: $userId)';
  
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'timestamp': timestamp?.toIso8601String(),
      'action': action,
      'userId': userId,
      'metadata': metadata,
    };
  }
  
  static CounterModel fromJson(Map<String, dynamic> json) {
    return CounterModel(
      value: json['value'] ?? 0,
      timestamp: json['timestamp'] != null 
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
      action: json['action'] ?? 'unknown',
      userId: json['userId'],
      metadata: json['metadata'],
    );
  }
}
