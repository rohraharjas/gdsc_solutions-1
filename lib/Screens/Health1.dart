import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  const Health({Key? key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Did you know?'),
                Tab(text: 'Doctors & Dieticians'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  DidYouKnowSection(),
                  DoctorsAndDieticiansSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DidYouKnowSection extends StatelessWidget {
  const DidYouKnowSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SwifTip for the day:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Just 1 donation can save up to 3 lives!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsAndDieticiansSection extends StatelessWidget {
  const DoctorsAndDieticiansSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          DoctorCard(
            name: 'Dr. John Doe',
            specialty: 'Cardiologist',
            imageUrl: 'assets/images/doctor1.jpg',
          ),
          DoctorCard(
            name: 'Dr. Jane Smith',
            specialty: 'Pediatrician',
            imageUrl: 'assets/images/doctor2.jpg',
          ),
          DoctorCard(
            name: 'Dr. Michael Johnson',
            specialty: 'Dietician',
            imageUrl: 'assets/images/doctor3.jpg',
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  const DoctorCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 200,
            height: 150,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  specialty,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
