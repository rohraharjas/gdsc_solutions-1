import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<UserRequest> display = [
    UserRequest( location: 'Pune', bld_type: 'O+ve', contact: '9876543210'),
    UserRequest( location: 'Mumbai', bld_type: 'A+ve', contact: '9876543211'),
    UserRequest( location: 'PCMC', bld_type: 'B+ve', contact: '9876543212'),
    UserRequest( location: 'Navi Mumbai', bld_type: 'AB+ve', contact: '9876543213')
  ];
  final _formKey = GlobalKey<FormState>();
  final bld_controller = TextEditingController();
  final loc_controller = TextEditingController();
  final contact_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: () async {
          await showDialog<void>(
              context: context,
              builder: (context) => Dialog(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned(
                      right: -40,
                      top: -40,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.white,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(60,8,0,2),
                      child: Text(
                        'Create A New Request',
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red[800],
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4,16,4,4),
                            child: TextFormField(
                              controller: bld_controller,
                              decoration: const InputDecoration(
                                labelText: 'Blood Type Required: ',
                                labelStyle: TextStyle(
                                  fontSize: 10
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: TextFormField(
                              controller: loc_controller,
                              decoration: const InputDecoration(
                                labelText: 'Location: ',
                                labelStyle: TextStyle(
                                  fontSize: 10
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: TextFormField(
                              controller: contact_controller,
                              decoration: const InputDecoration(
                                labelText: 'Contact: ',
                                labelStyle: TextStyle(
                                  fontSize: 10
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: ElevatedButton(
                              child: const Text('Submit',style: TextStyle(color: Colors.redAccent),),
                              onPressed: () {
                                setState(() {
                                  display.add(UserRequest(location: loc_controller.text, bld_type: bld_controller.text, contact: contact_controller.text));
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
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
                            fontWeight: FontWeight.bold
                        ),
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
                    'Required ${display[index].bld_type} Blood Urgently in and near by ${display[index].location}',
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
  String location, bld_type, contact;

  UserRequest({ required this.location, required this.bld_type, required this.contact});
}


