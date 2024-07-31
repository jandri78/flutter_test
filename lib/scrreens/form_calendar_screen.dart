import 'package:flutter/material.dart';

/// Flutter code sample for [showTimePicker].
import 'package:provider/provider.dart';
import '../provider/formProvider.dart';
import 'calendars/calendar_fusion.dart';

class TimePickerDemo extends StatefulWidget {

  static const String routeName = '/TimePickerDemo';
  DateTime? date ;
  TimePickerDemo(this.date);

  @override
  TimePickerDemoState createState() => TimePickerDemoState(date!);
}

class TimePickerDemoState extends State<TimePickerDemo> {
  DateTime fecha ;

  TimeOfDay _selectedTime = TimeOfDay.now();

  TimeOfDay _selectedEndTime = TimeOfDay.now();

  DateTime _startDate = DateTime.now();

  DateTime _endDate = DateTime.now();


  TimePickerDemoState(this.fecha);

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      if (mounted) {
        setState(() {
          _selectedTime = picked;
         _startDate = DateTime(fecha.year, fecha.month, fecha.day, _selectedTime.hour ,_selectedTime.minute);
        });
      }
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
     initialTime: _selectedEndTime,
    );
    if (picked != null && picked != _selectedEndTime) {
      if (mounted) {
        setState(() {
          _selectedEndTime = picked;
          _endDate = DateTime(fecha.year, fecha.month, fecha.day, _selectedEndTime.hour ,_selectedEndTime.minute);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = Provider.of<FormProvider>(context);
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de TimePicker'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Fecha de Reservacion: ${fecha.year} - ${fecha.month} - ${fecha.day}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Hora inicio: ${_selectedTime.format(context)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {
                _selectTime(context),
              },
              child: Text('Seleccionar Hora'),
            ),
            Text(
              'Hora fin: ${_selectedEndTime.format(context)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {
                _selectTime2(context),
              },
              child: Text('Seleccionar Hora'),
            ),

            ElevatedButton(
              onPressed: () {
                formProvider.setStartTime = _startDate;
                formProvider.setEndTime = _endDate;
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}