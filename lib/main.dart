import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/Donor/events.dart';
import 'package:gdsc_solutions/Screens/Donor/profile.dart';
import 'package:gdsc_solutions/Screens/Health1.dart';
import 'package:gdsc_solutions/Screens/authenticate/authenticate.dart';
import 'package:gdsc_solutions/Screens/faq.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:gdsc_solutions/Screens/home.dart';
import 'package:gdsc_solutions/Screens/update_med_records.dart';
import 'package:gdsc_solutions/Screens/wrapper.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:gdsc_solutions/Screens/authenticate/signin.dart';
// import 'firebase_options.dart';
import 'package:gdsc_solutions/Screens/userprofile.dart';

import 'Screens/Organisations/CampSlots.dart';
import 'Screens/Organisations/homeOrg.dart';

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
    return const MaterialApp(
      home: Wrapper(),
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
  final screensUser = [
    const Faq(),
    const Health(),
    const HomeWidget(),
    const EventsPages(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      drawer: const AppDrawer(),
      body: screensUser[widget.currentIndex],
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
              Icons.help_rounded,
              size: 32,
            ),
            label: 'Help',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.health_and_safety,
                size: 32,
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
                Icons.add_business_rounded,
                size: 32,
              ),
              label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}

class HomeOrganisation extends StatefulWidget {
  int currentOrgIndex;
  HomeOrganisation({super.key,required this.currentOrgIndex});

  @override
  State<HomeOrganisation> createState() => _HomeOrganisationState();
}

class _HomeOrganisationState extends State<HomeOrganisation> {

  final screensOrg = [
    const CampSlots(),
    const HomeOrgWidget(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      drawer: const AppDrawer(),
      body: screensOrg[widget.currentOrgIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey[700],
        currentIndex: widget.currentOrgIndex,
        onTap: (index) => setState(() {
          widget.currentOrgIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_business_rounded,
                size: 35,
              ),
              label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.water_drop,
                size: 70,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, required BuildContext context})
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
              onPressed: () {
                Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage2(),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            )
          ],
        );
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var pages = [
      Home(currentIndex: 2),
      Home(currentIndex: 3),
      Home(currentIndex: 4),
      Home(currentIndex: 0),
      Home(currentIndex: 1),
      const MedRecordsPage()
    ];
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    pages[titles.indexOf(x)]));
                      },
                    ))
                .toList()),
      ),
    );
  }
}
