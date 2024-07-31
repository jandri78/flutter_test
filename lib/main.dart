import 'package:flutter/material.dart';
import 'package:myapp/provider/formProvider.dart';
import 'package:myapp/scrreens/calendars/calendar_screen.dart';
import 'package:myapp/scrreens/calendars/calendar_fusion.dart';
import 'package:myapp/scrreens/calendars/calendar_view_screen.dart';
import 'package:myapp/scrreens/calendars/table_calendar.dart';
import 'package:myapp/scrreens/form_calendar_screen.dart';
import 'package:myapp/scrreens/home_screen.dart';
import 'package:myapp/scrreens/settings_screen.dart';
import 'package:myapp/scrreens/testwidget.dart';
import 'package:myapp/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => FormProvider()),
          ],
      child: const MyApp(),
      )
      );
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
        CalendarFusionScreen.routeName: (context) => const CalendarFusionScreen(),
        TableCalendarPage.routeName: (context) => const TableCalendarPage(),
        TimePickerDemo.routeName: (context) => TimePickerDemo(DateTime.now()),
        ShowTimePickerApp.routeName: (context) => const ShowTimePickerApp(),// test
        CalendarViewPage.routeName: (context) => CalendarViewPage(),

      },
      theme: Preferences.isDarkmode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
    );
  }
}
