import 'package:flutter/material.dart';
import 'package:myapp/scrreens/calendars/calendar_screen.dart';
import 'package:myapp/scrreens/calendars/calendar_fusion.dart';
import 'package:myapp/scrreens/home_screen.dart';
import 'package:myapp/scrreens/settings_screen.dart';

import '../scrreens/Formulario.dart';
import '../scrreens/calendars/calendar_view_screen.dart';
import '../scrreens/calendars/table_calendar.dart';
import '../scrreens/form_calendar_screen.dart';
import '../scrreens/testwidget.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'),
              fit: BoxFit.cover,
            )),
            child: Container(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Booking Calendar'),
            onTap: () {
              Navigator.pushNamed(context, CalendarScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendar view'),
            onTap: () {
              Navigator.pushNamed(context, CalendarFusionScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_align_center),
            title: const Text('Form view'),
            onTap: () {
              Navigator.pushNamed(context, TimePickerDemo.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_sharp),
            title: const Text('Picker'),
            onTap: () {
              Navigator.pushNamed(context, ShowTimePickerApp.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_view_day),
            title: const Text('Table Calendar'),
            onTap: () {
              Navigator.pushNamed(context, TableCalendarPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_view_day),
            title: const Text('View Calendar'),
            onTap: () {
              Navigator.pushNamed(context, CalendarViewPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
