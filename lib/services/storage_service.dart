import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

class StorageService {
  static const String _counterKey = 'counter_data';
  static const String _historyKey = 'counter_history';
  
  static Future<void> saveCounter(CounterModel counter) async {
    try {
      final json = jsonEncode(counter.toJson());
      debugPrint('Counter saved to storage: $json');
    } catch (e) {
      debugPrint('Error saving counter: $e');
    }
  }
  
  static Future<CounterModel?> loadCounter() async {
    try {
      // Simulate loading from storage
      await Future.delayed(const Duration(milliseconds: 50));
      return null; // Return null for demo
    } catch (e) {
      debugPrint('Error loading counter: $e');
      return null;
    }
  }
  
  static Future<void> saveHistory(List<CounterModel> history) async {
    try {
      final jsonList = history.map((item) => item.toJson()).toList();
      final json = jsonEncode(jsonList);
      debugPrint('History saved to storage: $json');
    } catch (e) {
      debugPrint('Error saving history: $e');
    }
  }
  
  static Future<List<CounterModel>> loadHistory() async {
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      return []; // Return empty list for demo
    } catch (e) {
      debugPrint('Error loading history: $e');
      return [];
    }
  }
  
  static Future<void> clearAll() async {
    try {
      await Future.delayed(const Duration(milliseconds: 20));
      debugPrint('All storage cleared');
    } catch (e) {
      debugPrint('Error clearing storage: $e');
    }
  }
}

extension CounterModelExtension on CounterModel {
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'timestamp': timestamp?.toIso8601String(),
      'action': action,
    };
  }
  
  static CounterModel fromJson(Map<String, dynamic> json) {
    return CounterModel(
      value: json['value'] ?? 0,
      timestamp: json['timestamp'] != null 
          ? DateTime.parse(json['timestamp'])
          : null,
      action: json['action'] ?? 'unknown',
    );
  }
}
