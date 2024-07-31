import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/formProvider.dart';

class FormExample extends StatefulWidget {
  static const String routeName = '/FormExample';

  DateTime fecha;

  FormExample(this.fecha, {super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  TimeOfDay selectedTime = TimeOfDay.now();

  String d = 'd';

  Future<void> selectTime(BuildContext contextr) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      d = picked.format(contextr);
      setState(() {
        selectedTime = picked;
        d = picked.format(contextr);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = Provider.of<FormProvider>(context);
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();

    return Form(
        key: formKey,
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            controller: nameController,
          ),
          ElevatedButton(
            onPressed: () {
              formProvider.name = nameController.text;
            },
            child: const Text('Enviar'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              child: const Text('Open time picker'),
              onPressed: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: selectedTime ?? TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.dial,
                  orientation: Orientation.portrait,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            alwaysUse24HourFormat: true,
                          ),
                          child: child!,
                        ),
                      ),
                    );
                  },
                );
                setState(() {
                  selectedTime = time!;
                });
              },
            ),
          ),
          if (selectedTime != null)
            Text('Selected time: ${selectedTime!.format(context)}'),
        ]));
  }
}
