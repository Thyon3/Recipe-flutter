class CounterModel {
  final int value;
  final DateTime timestamp;
  final String action;
  
  const CounterModel({
    required this.value,
    required this.timestamp,
    required this.action,
  });
  
  CounterModel copyWith({
    int? value,
    DateTime? timestamp,
    String? action,
  }) {
    return CounterModel(
      value: value ?? this.value,
      timestamp: timestamp ?? this.timestamp,
      action: action ?? this.action,
    );
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterModel &&
        other.value == value &&
        other.timestamp == timestamp &&
        other.action == action;
  }
  
  @override
  int get hashCode => value.hashCode ^ timestamp.hashCode ^ action.hashCode;
  
  @override
  String toString() => 'CounterModel(value: $value, timestamp: $timestamp, action: $action)';
}
