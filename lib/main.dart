import 'package:flutter/material.dart';
import 'package:lastwinner/EditTicket.dart';
import 'package:lastwinner/HomePage.dart';
import 'package:lastwinner/SpinWheelApp.dart'; // Import SpinWheel instead of SpinWheelApp

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Last Winner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ParticipationPage(),
    SpinWheelApp(),
    AddTicketPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan),
            label: 'Spin Wheel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.girl),
            label: 'Add Ticket',
          ),
        ],
      ),
    );
  }
}

// Rest of your code remains the same