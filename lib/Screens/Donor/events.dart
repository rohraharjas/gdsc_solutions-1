import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc_solutions/main.dart';

class EventsPages extends StatefulWidget {
  const EventsPages({super.key});

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
          drawer: const AppDrawer(),
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
                    Tab(
                      child: Text(
                        'CampCards',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Locations',
                      ),
                    )
                  ]),
              const Expanded(
                child: TabBarView(children: [
                  CampCards(),
                  Center(
                    child: Location(),
                  )
                ]),
              )
            ],
          )),
    );
  }
}

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<CampInfo> info = [
    CampInfo(
        org_body: 'Org A',
        lic_id: 'gh3456',
        location: 'Pune Institute of Computer Technology',
        timing: '2024-03-01 03:09:00Z',
        slots: 6),
    CampInfo(
        org_body: 'Org B',
        lic_id: 'tr7890',
        location: 'Cummins College of Engineering for Women',
        timing: '2024-03-01 03:30:00Z',
        slots: 6),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
          child: Text(
            'Locate Camps',
            style: TextStyle(
                color: Colors.red[800],
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red[800]),
          ),
        ),
        // const GoogleMap(
        //   initialCameraPosition: CameraPosition(
        //     target: LatLng(0,0)
        //   ),
        // )
      ],
    );
  }
}

class CampCards extends StatefulWidget {
  const CampCards({super.key});

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
        slots: 6),
    CampInfo(
        org_body: 'Org B',
        lic_id: 'tr7890',
        location: 'Cummins College of Engineering for Women',
        timing: '2024-03-01 03:30:00Z',
        slots: 6),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: info.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5)),
          title: Text('Organising Body: ${info[index].org_body}\n'
              'Location: ${info[index].location}\n'
              'Date: ${info[index].getDate()}\n'
              'Time: ${info[index].getTime()}'),
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
    return "${DateTime.parse(timing).day}/${DateTime.parse(timing).month}/${DateTime.parse(timing).year}";
  }

  String getTime() {
    return "${DateTime.parse(timing).hour}:${(DateTime.parse(timing).minute) > 9 ? DateTime.parse(timing).minute : '0${DateTime.parse(timing).minute}'}";
  }
}
