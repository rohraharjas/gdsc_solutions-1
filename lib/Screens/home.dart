import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<UserRequest> display = [
    UserRequest(location: 'Pune', bld_type: 'O+ve', contact: '9876543210'),
    UserRequest(location: 'Mumbai', bld_type: 'A+ve', contact: '9876543211'),
    UserRequest(location: 'PCMC', bld_type: 'B+ve', contact: '9876543212'),
    UserRequest(location: 'Navi Mumbai', bld_type: 'AB+ve', contact: '9876543213'),
  ];
  final _formKey = GlobalKey<FormState>();
  final bld_controller = TextEditingController();
  final loc_controller = TextEditingController();
  final contact_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/img1.jpg',
      'assets/images/img2.png',
      'assets/images/img3.jpg',
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Existing showDialog code...
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.create,
          color: Colors.red[800],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '529',
                        style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Registered Users',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '43',
                        style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Donors Available',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '13',
                        style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pending Requests',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            // CarouselSlider added here
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList.map((item) => Center(
                child: Image.asset(item, fit: BoxFit.cover, width: 1000),
              )).toList(),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
              child: Text(
                'User Requests',
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[800],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              shrinkWrap: true, // to make ListView take the size of its children
              itemCount: display.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(
                    'Required ${display[index].bld_type} Blood Urgently in and near by ${display[index].location}',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserRequest {
  String location, bld_type, contact;

  UserRequest({required this.location, required this.bld_type, required this.contact});
}
