import 'package:flutter/material.dart';
import 'package:myapp/shared_preferences/preferences.dart';
import 'package:myapp/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
          elevation: 50.0,
        ),
        drawer: const SideMenu(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Divider(),
          Text('Darkmode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Genero: ${Preferences.gender}'),
          const Divider(),
          Text('Nombre de Usuario s: ${Preferences.name}'),
          const Divider(),
        ]));
  }
}
