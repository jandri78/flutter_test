import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../provider/event_model.dart';

class TableCalendarPage extends StatefulWidget {
  static const String routeName = '/TableCalendarPage';

  const TableCalendarPage({super.key});

  @override
  _TableCalendarPageState createState() => _TableCalendarPageState();
}

class _TableCalendarPageState extends State<TableCalendarPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> eventsMap = {};

  TextEditingController _eventController = TextEditingController();

  Event event1 = Event(
      title: 'Test',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(hours: 2)),
      color: const Color.fromARGB(255, 37, 15, 201));

  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  Event createEvent(String title, DateTime startDate) {
    return Event(
        title: title,
        startDate: startDate,
        endDate: startDate.add(const Duration(hours: 2)),
        color: const Color.fromARGB(255, 37, 15, 201));
  }

  List<Event> addEventAcordingToDate(Map<DateTime, List<Event>> incomingMap,
      DateTime selectedDay, Event newEvent) {
    List<Event> listEvent = incomingMap[selectedDay] ?? [];
    listEvent.add(newEvent);

    return listEvent;
  }

  List<Event> _getEventsForDay(DateTime selectedDay) {
    List<Event> response = eventsMap[selectedDay] ?? [];
    return response;
  }

  @override
  Widget build(BuildContext context) {
    List<Event> eventList = [event1];
    eventsMap[DateTime(
            _focusedDay.year, _focusedDay.month, _focusedDay.day, 0, 0, 0, 0)] =
        eventList;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Table Calendar View Example'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('Event Name'),
                    content: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _eventController,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            eventsMap[_selectedDay!] = addEventAcordingToDate(
                                eventsMap,
                                _selectedDay!,
                                createEvent(
                                    _eventController.text, _selectedDay!));
                            //eventsMap.addAll({_selectedDay!: [createEvent(_eventController.text, _selectedDay!)]});
                            Navigator.of(context).pop();
                            _selectedEvents.value =
                                _getEventsForDay(_focusedDay!);
                            setState(() {});
                          },
                          child: const Text('Submit'))
                    ],
                  );
                });
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Selected Day = ${_focusedDay.toString().split(' ')[0]}'),
              TableCalendar(
                calendarFormat: calendarFormat,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                eventLoader: _getEventsForDay,
                selectedDayPredicate: (day) {
                  return isSameDay(day, _focusedDay);
                },
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                availableGestures: AvailableGestures.all,
                onDaySelected: _onDaySelected,
                onDayLongPressed: (date1, date2) =>
                    {print('onDayLongPressed $date1 -- $date2')},
              ),
              Expanded(
                  child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => print('presionado'),
                          title: Text(
                              textAlign: TextAlign.center,
                              '${value[index].title} - ${value[index].startDate.toString().split(' ')[0]}'),
                        ),
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ));
  }
}
