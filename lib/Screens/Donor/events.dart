import 'package:flutter/material.dart';

import '../authenticate/blodonation_checklst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC Solutions',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: EventsPages(),
    );
  }
}

class EventsPages extends StatefulWidget {
  const EventsPages({Key? key}) : super(key: key);

  @override
  State<EventsPages> createState() => _EventsPagesState();
}

class _EventsPagesState extends State<EventsPages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              indicatorColor: Colors.red[800],
              labelStyle: TextStyle(
                color: Colors.red[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              tabs: const [
                Tab(text: 'CampCards'),
                Tab(text: 'Locations'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  CampCards(),
                  Location(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
          child: Text(
            'Locate Camps',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red[800],
            ),
          ),
        ),
        Expanded( // Use Expanded to make the image take up all remaining space
          child: Image.asset('assets/images/locatecamps.PNG', fit: BoxFit.cover), // Load the image from assets
        ),
      ],
    );
  }
}

class CampCards extends StatefulWidget {
  const CampCards({Key? key}) : super(key: key);

  @override
  State<CampCards> createState() => _CampCardsState();
}

class _CampCardsState extends State<CampCards> {
  List<CampInfo> info = [
    CampInfo(
      org_body: 'Org A',
      lic_id: 'gh3456',
      location: 'Pune Institute of Computer Technology',
      timing: '2024-03-01 03:09:00Z',
      slots: 6,
    ),
    CampInfo(
      org_body: 'Org B',
      lic_id: 'tr7890',
      location: 'Cummins College of Engineering for Women',
      timing: '2024-03-01 03:30:00Z',
      slots: 6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: info.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Organising Body: ${info[index].org_body}'),
              Text('Location: ${info[index].location}'),
              Text('Date: ${info[index].getDate()}'),
              Text('Time: ${info[index].getTime()}'),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodDonationChecklist()),
                  );
                },
                child: Text(
                  'Check eligibility',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CampInfo {
  String org_body, lic_id, location, timing;
  int slots;

  CampInfo({
    required this.org_body,
    required this.lic_id,
    required this.location,
    required this.timing,
    required this.slots,
  });

  String getDate() {
    DateTime parsedDate = DateTime.parse(timing);
    return "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";
  }

  String getTime() {
    DateTime parsedTime = DateTime.parse(timing);
    return "${parsedTime.hour}:${parsedTime.minute.toString().padLeft(2, '0')}";
  }
}

