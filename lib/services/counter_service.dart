import 'dart:async';
import 'package:flutter/foundation.dart';

class CounterService {
  static int _currentValue = 0;
  static final StreamController<int> _counterController = StreamController<int>.broadcast();
  static final StreamController<String> _actionController = StreamController<String>.broadcast();
  
  static Stream<int> get counterStream => _counterController.stream;
  static Stream<String> get actionStream => _actionController.stream;
  
  static int get currentValue => _currentValue;
  
  static void increment() {
    _currentValue++;
    _counterController.add(_currentValue);
    _actionController.add('increment');
    debugPrint('Counter incremented to: $_currentValue');
  }
  
  static void decrement() {
    if (_currentValue > 0) {
      _currentValue--;
      _counterController.add(_currentValue);
      _actionController.add('decrement');
      debugPrint('Counter decremented to: $_currentValue');
    }
  }
  
  static void reset() {
    _currentValue = 0;
    _counterController.add(_currentValue);
    _actionController.add('reset');
    debugPrint('Counter reset to: $_currentValue');
  }
  
  static void setValue(int value) {
    _currentValue = value;
    _counterController.add(_currentValue);
    _actionController.add('setValue');
    debugPrint('Counter set to: $_currentValue');
  }
  
  static void dispose() {
    _counterController.close();
    _actionController.close();
  }
}
