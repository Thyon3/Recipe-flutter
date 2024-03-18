import 'dart:async';
import 'package:flutter/foundation.dart';

class CounterService {
  static int _currentValue = 0;
  static final StreamController<int> _counterController = StreamController<int>.broadcast();
  
  static Stream<int> get counterStream => _counterController.stream;
  
  static int get currentValue => _currentValue;
  
  static void increment() {
    _currentValue++;
    _counterController.add(_currentValue);
    debugPrint('Counter incremented to: $_currentValue');
  }
  
  static void decrement() {
    if (_currentValue > 0) {
      _currentValue--;
      _counterController.add(_currentValue);
      debugPrint('Counter decremented to: $_currentValue');
    }
  }
  
  static void reset() {
    _currentValue = 0;
    _counterController.add(_currentValue);
    debugPrint('Counter reset to: $_currentValue');
  }
  
  static void dispose() {
    _counterController.close();
  }
}
