// event_model.dart

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final Color color;

  Event({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.color,
  });
}
