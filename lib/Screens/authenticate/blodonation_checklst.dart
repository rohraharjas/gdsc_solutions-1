import 'package:flutter/material.dart';
import '../../main.dart';
import '../Organisations/BookSlot.dart';
import 'health_history.dart'; // Ensure this import points to your HealthHistoryQuestions screen correctly.

class BloodDonationChecklist extends StatefulWidget {
  @override
  _BloodDonationChecklistState createState() => _BloodDonationChecklistState();
}

class _BloodDonationChecklistState extends State<BloodDonationChecklist> {
  final Map<String, bool> checklistItems = {
    'Consumed alcohol in last 24 hours': false,
    'Suffering from cough or cold': false,
    'Having any weakness today': false,
    'Having any loose motions': false,
    'Donated platelets in last 28 days': false,
    'Donated blood in last 4 months': false,
    'Had malaria in last 3 months': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloodBridge'),
        backgroundColor: Colors.red, // Enhanced: Red theme for AppBar
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to avoid overflow
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Enhanced: Padding for overall layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tick if you have done the following',
                style: TextStyle(
                  color: Colors.red.shade700, // Enhanced: Red theme for headline
                  fontSize: 24, // Enhanced: Larger font size for headline
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...checklistItems.keys.map((String key) { // Enhanced: Spread operator for a cleaner build method
                return CheckboxListTile(
                  title: Text(key),
                  value: checklistItems[key],
                  activeColor: Colors.red, // Enhanced: Red theme for checkboxes
                  onChanged: (bool? value) {
                    setState(() {
                      checklistItems[key] = value!;
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SlotBookingScreen()),
          );
        },
        backgroundColor: Colors.red, // Enhanced: Red theme for FloatingActionButton
        child: Icon(Icons.navigate_next),
        tooltip: 'Next',
      ),
    );
  }
}
