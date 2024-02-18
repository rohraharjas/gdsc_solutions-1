import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/Donor/events.dart';
import 'package:gdsc_solutions/Screens/Health1.dart';
import 'package:gdsc_solutions/Screens/authenticate/authenticate.dart';
import 'package:gdsc_solutions/Screens/authenticate/signin.dart';
import 'package:gdsc_solutions/Screens/faq.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:gdsc_solutions/Screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:gdsc_solutions/Screens/authenticate/signin.dart';
// import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(
        currentIndex: 0,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  int currentIndex;
  Home({super.key, required this.currentIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screens = [
    SignInPage2(),
    SignInPage(),
    Faq(),
    Health(),
    const HomeWidget(),
    const EventsPages(),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 60)))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const AppDrawer(),
      body: screens[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey[700],
        currentIndex: widget.currentIndex,
        onTap: (index) => setState(() {
          widget.currentIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
              size: 28,
            ),
            label: 'Help',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_services,
                size: 28,
              ),
              label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.water_drop,
                size: 60,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 28,
              ),
              label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar({super.key})
      : super(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.red[800],
          title: Center(
            child: Text('BloodBridge',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ))
          ],
        );
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var titles = [
      'Home',
      'Events',
      'Profile',
      'FAQs',
      'Medical Assistance',
      'Update Medical Records'
    ];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red[800],
                ),
                child: const Text(
                  'Hello ;p',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              )
            ] +
            (titles
                .map((x) => ListTile(
                      title: Text(
                        x,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ))
                .toList()),
      ),
    );
  }
}
