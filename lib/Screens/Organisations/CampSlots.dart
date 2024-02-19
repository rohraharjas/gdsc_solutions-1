import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc_solutions/main.dart';

class CampSlots extends StatefulWidget {
  const CampSlots({super.key});

  @override
  State<CampSlots> createState() => _CampSlotsState();
}

class _CampSlotsState extends State<CampSlots> {
  List<CampSlotInfo> slotlist = [
    CampSlotInfo(
        centre: 'ABC Centre, Wagholi',
        location: 'XY Society, WV Bypass, Wagholi, PinCode:4110XX',
        timing: '2024-03-01 03:09:00Z',
        slotsno: 8),
    CampSlotInfo(
        centre: 'ABC Centre,Hadapsar',
        location: 'MM Society, MGP Road, Hadapsar, PinCode:4110XX',
        timing: '2024-03-07 10:00:00Z',
        slotsno: 8),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:20),
        Padding(
          padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
          child: Text(
            'Upcoming Scheduled Camps',
            style: TextStyle(
                color: Colors.red[800],
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red[800]),
          ),
        ),
    ListView.builder(
    shrinkWrap: true,
    itemCount: slotlist.length,
    itemBuilder: (context, index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
    onTap: () {},
    shape: RoundedRectangleBorder(
    side: const BorderSide(color: Colors.black, width: 1),
    borderRadius: BorderRadius.circular(5)),
    title: Text('Centre of Donation: ${slotlist[index].centre}\n'
    'Address: ${slotlist[index].location}\n'
    'Date: ${slotlist[index].getDate()}\n'
    'Starting Time: ${slotlist[index].getTime()}'),
    ),
    ),
    ),
      ],
    );
  }
}

class CampSlotInfo {
  String centre, location, timing;
  int slotsno;
  CampSlotInfo({
    required this.centre,
    required this.location,
    required this.timing,
    required this.slotsno,
  });

  String getDate() {
    return "${DateTime.parse(timing).day}/${DateTime.parse(timing).month}/${DateTime.parse(timing).year}";
  }

  String getTime() {
    return "${DateTime.parse(timing).hour}:${(DateTime.parse(timing).minute) > 9 ? DateTime.parse(timing).minute : '0${DateTime.parse(timing).minute}'}";
  }
}
