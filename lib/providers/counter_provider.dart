import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';
import '../services/counter_service.dart';

class CounterProvider extends ChangeNotifier {
  CounterModel _counter = const CounterModel(
    value: 0,
    timestamp: null,
    action: 'initialized',
  );
  
  CounterModel get counter => _counter;
  
  CounterProvider() {
    CounterService.counterStream.listen((value) {
      _counter = _counter.copyWith(
        value: value,
        timestamp: DateTime.now(),
        action: 'incremented',
      );
      notifyListeners();
    });
  }
  
  void increment() {
    CounterService.increment();
  }
  
  void decrement() {
    CounterService.decrement();
  }
  
  void reset() {
    CounterService.reset();
  }
  
  @override
  void dispose() {
    CounterService.dispose();
    super.dispose();
  }
}
