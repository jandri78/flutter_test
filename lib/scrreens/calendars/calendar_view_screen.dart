import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

DateTime get _now => DateTime.now();

class CalendarViewPage extends StatelessWidget {
  static const String routeName = '/CalendarViewPage';

  final event = CalendarEventData(
    date: DateTime(2021, 8, 10),
    endDate: DateTime(2021,8,15),
    event: "Event 1",
    title: 'Event 1',
  );

  late DateTime date ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calendar Page Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MonthView(
            controller: EventController(),
            // to provide custom UI for month cells.
            minMonth: DateTime(2020),
            maxMonth: DateTime(2050),
            initialMonth: DateTime.now(),
            headerStyle: HeaderStyle(
              titleAlign: TextAlign.center
            ),
            cellAspectRatio: 1,
            onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
            onCellTap: (events, date) {
              // Implement callback when user taps on a cell.
              print(events);
            },
            startDay: WeekDays.monday, // To change the first day of the week.
            // This callback will only work if cellBuilder is null.
            onEventTap: (event, date) => print(event),
            onEventDoubleTap: (events, date) => print(events),
            onEventLongTap: (event, date) => print(event),
            onDateLongPress: (date) => print(date),
            showBorder: true,
            //headerBuilder: MonthHeader.hidden, // To hide month header
            showWeekTileBorder: false, // To show or hide header border
            hideDaysNotInMonth: true, // To hide days or cell that are not in current
          ),
        ),
      ),
    );
  }
}

List<CalendarEventData> _events = [
  CalendarEventData(
    date: _now,
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    title: "Football Tournament",
    description: "Go to football tournament.",
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 3)),
    startTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
    endTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        16),
    title: "Team Meeting",
    description: "Team Meeting",
  ),
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        10),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        12),
    title: "Chemistry Viva",
    description: "Today is Joe's birthday.",
  ),
];
