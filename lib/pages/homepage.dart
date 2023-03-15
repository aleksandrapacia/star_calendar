import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: const Text('Star Calendar'),
          elevation: 0,
          backgroundColor: Colors.blue[400],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Log in',
            ),
          ],
        ));
  }
}
