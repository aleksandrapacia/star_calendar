import 'package:flutter/material.dart';
import 'package:star_calendar/pages/home_page.dart';

const routeHome = '/';
const routeSettings = '/settings';
const routeMyHomePage = '/setup/';
const routeDeviceSetupStart = '/setup/$routeMyHomePage';
const routeNotesPage = 'notes_page';
const routeCalendarPage = 'caledandar_page';

void main() async {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: const Color.fromRGBO(4, 131, 184, .1),
  100: const Color.fromRGBO(4, 131, 184, .2),
  200: const Color.fromRGBO(4, 131, 184, .3),
  300: const Color.fromRGBO(4, 131, 184, .4),
  400: const Color.fromRGBO(4, 131, 184, .5),
  500: const Color.fromRGBO(4, 131, 184, .6),
  600: const Color.fromRGBO(4, 131, 184, .7),
  700: const Color.fromRGBO(4, 131, 184, .8),
  800: const Color.fromRGBO(4, 131, 184, .9),
  900: const Color.fromRGBO(4, 131, 184, 1),
};

MaterialColor myColor = MaterialColor(0xFFb37efc, color);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Calendar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: myColor),
      home: const MyHomePage(),
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == routeMyHomePage) {
          page = const MyHomePage();
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
  }
}
