import 'package:flutter/material.dart';
import 'package:myapp/shared_preferences/preferences.dart';
import 'package:myapp/widgets/side_menu.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// bool isDarkmode = false;
  /// int gender = 1;
  /// String name = 'Andres';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: const Text('Settings Screen'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 24),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
                secondary: const Icon(Icons.dark_mode),
                value: Preferences.isDarkmode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                  activeColor: Colors.green,
                  value: 1,
                  groupValue: Preferences.gender,
                  title: const Text('Masculino'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  activeColor: Colors.green,
                  value: 2,
                  groupValue: Preferences.gender,
                  title: const Text('Femenino'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      initialValue: Preferences.name,
                      onChanged: (value) {
                        Preferences.name = value;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nombre de Usuario',
                        helperText: 'Nombre de Usuario',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      )))
            ]),
          ),
        ));
  }
}
