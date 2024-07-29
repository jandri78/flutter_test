import 'package:flutter/material.dart';
import 'package:myapp/scrreens/calendar_screen.dart';
import 'package:myapp/scrreens/calendar_view.dart';
import 'package:myapp/scrreens/home_screen.dart';
import 'package:myapp/scrreens/settings_screen.dart';
import 'package:myapp/shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        CalendarScreen.routeName: (context) => const CalendarScreen(),
        CalendarViewScreen.routeName: (context) => const CalendarViewScreen(),
      },
      theme: Preferences.isDarkmode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
    );
  }
}
