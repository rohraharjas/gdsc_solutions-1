import 'package:flutter/material.dart';

import '../../main.dart';


class SlotBookingScreen extends StatelessWidget {
  final List<DonationSlot> slots = [
    DonationSlot(time: '9-10 am', seatsAvailable: 12),
    DonationSlot(time: '10-11 am', seatsAvailable: 1),
    DonationSlot(time: '11-12 am', seatsAvailable: 6),
    DonationSlot(time: '1-2 pm', seatsAvailable: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloodBridge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book a slot for blood donation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red.shade800),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: slots.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                slots[index].time,
                                style: TextStyle(fontSize: 20, color: Colors.red.shade800, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${slots[index].seatsAvailable} seats available',
                                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              // Assuming HomeScreen is the target, adjust as necessary
                              // Navigator.of(context).pushNamed('/home');
                              showBookingPopup(context);
                            },
                            child: Icon(Icons.bookmark_add_outlined, color: Colors.red.shade800, size: 40),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBookingPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Slot Booked"),
          content: Text("Your slot has been successfully booked."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home(currentIndex: 2)),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class DonationSlot {
  final String time;
  final int seatsAvailable;

  DonationSlot({
    required this.time,
    required this.seatsAvailable,
  });
}
