import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  String _nameEvent = 'test_provider';

  DateTime _startTime = DateTime.now();

  DateTime _endTime = DateTime.now();

  get nameEvent {
    return _nameEvent;
  }

  set name(String name) {
    _nameEvent = name;
    notifyListeners();
  }

  get startTime {
    return _startTime;
  }

  set setStartTime(DateTime startTime) {
    _startTime = startTime;
    notifyListeners();
  }

  get endTime {
    return _endTime;
  }

  set setEndTime(DateTime endTime) {
    print('setEndTime $endTime');
    _endTime = endTime;
    notifyListeners();
  }
}
