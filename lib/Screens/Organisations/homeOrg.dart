import 'package:flutter/material.dart';


class HomeOrgWidget extends StatefulWidget {
  const HomeOrgWidget({super.key});

  @override
  State<HomeOrgWidget> createState() => _HomeOrgState();
}

class _HomeOrgState extends State<HomeOrgWidget> {

  List<UserRequest> display = [
    UserRequest(name: 'Name 1', location: 'Loc 1', bld_type: 'O+ve', contact: '9876543210'),
    UserRequest(name: 'Name 2', location: 'Loc 2', bld_type: 'A+ve', contact: '9876543211'),
    UserRequest(name: 'Name 3', location: 'Loc 3', bld_type: 'B+ve', contact: '9876543212'),
    UserRequest(name: 'Name 4', location: 'Loc 4', bld_type: 'AB+ve', contact: '9876543213')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: () {},
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
                        '19',
                        style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'In-app Organisations',
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
                            fontWeight: FontWeight.bold
                        ),
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
                            fontWeight: FontWeight.bold
                        ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
              child: Text(
                'User Requests',
                style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            Divider(
              color: Colors.grey[800],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: display.length,
              itemBuilder: (context, index)=>Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  title: Text(
                    'Required ${display[index].bld_type} Blood Urgently',
                    style: TextStyle(
                        color: Colors.red[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserRequest{
  String name, location, bld_type, contact;
  UserRequest({required this.name, required this.location, required this.bld_type, required this.contact});
}