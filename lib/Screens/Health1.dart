import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              indicatorColor: Colors.red.shade800,
              labelStyle: TextStyle(
                color: Colors.red.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              tabs: const [
                Tab(text: 'Health Resources'),
                Tab(text: 'Doctors & Dieticians'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  DidYouKnowSection(),
                  DoctorsAndDieticiansSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DidYouKnowSection extends StatelessWidget {
  const DidYouKnowSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> articlesImgList = [
      'assets/images/img1.jpg',
      'assets/images/img2.png',
      'assets/images/img3.jpg',
    ];

    final List<String> videosImgList = [
      'assets/images/doctor1.jpg',
      'assets/images/doctor1.jpg',
      'assets/images/doctor1.jpg',
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Did You Know',
                style: TextStyle(
                  color: Colors.red.shade800,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Did you know that people who donate blood are 88% less likely to suffer a heart attack and 33% less likely to acquire any type of cardiovascular disease.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Articles worth a read!',
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16/9,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: articlesImgList.map((item) => Container(
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              )).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Understand through videos!',
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16/9,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: videosImgList.map((item) => Container(
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsAndDieticiansSection extends StatelessWidget {
  const DoctorsAndDieticiansSection({Key? key}) : super(key: key);

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
