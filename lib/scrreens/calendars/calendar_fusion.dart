import 'package:flutter/material.dart';
import 'package:myapp/scrreens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../provider/formProvider.dart';
import '../Formulario.dart';
import '../form_calendar_screen.dart';

class CalendarFusionScreen extends StatefulWidget {
  static const String routeName = '/calendarFusion';

  const CalendarFusionScreen({super.key});

  @override
  State<CalendarFusionScreen> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarFusionScreen> {
  final List<Meeting> meetings = <Meeting>[
    Meeting(
        'test',
        DateTime.now(),
        DateTime.now().add(const Duration(hours: 2)),
        const Color.fromARGB(255, 37, 15, 201),
        false)
  ];

  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = Provider.of<FormProvider>(context);

    String eventTitle = 'T-4 Apt-403';
    DateTime? fecha;
    return Scaffold(
        appBar: AppBar(
          title: Text('Gimnasio'),
        ),
        body: SfCalendar(
          onLongPress: (calendarLongPressDetails) => {
            fecha = calendarLongPressDetails.date,
            if (fecha != null)
              {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    //content: FormExample(fecha!),
                    content: TimePickerDemo(fecha),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(context, HomeScreen.routeName),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.pop(context, HomeScreen.routeName),
                          addMeeting(formProvider.startTime,
                              formProvider.endTime, eventTitle),
                          setState(() {}),
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              }
          },
          allowedViews: const [
            CalendarView.week,
            CalendarView.day,
            CalendarView.month
          ],
          view: CalendarView.week,
          dataSource: MeetingDataSource(meetings),
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
          ),
        ));
  }

  void addMeeting(DateTime? startDate, DateTime? endDate, String eventName) {
    print('addMeeting $startDate startDate');
    return meetings.add(Meeting(eventName, startDate!, endDate!,
        const Color.fromARGB(255, 37, 15, 201), false));
  }

  // ignore: unused_element
  List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
