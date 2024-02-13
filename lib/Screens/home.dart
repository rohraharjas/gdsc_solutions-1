import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:  IconThemeData(color: Colors.white),
        backgroundColor: Colors.red[800],
        title:  Center(
          child: Text(
            'BloodBridge',
            style: GoogleFonts.lora(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
              ),
            )
          ),
        ),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined, color: Colors.white,))],

      ),
      drawer:  Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey[700],
        currentIndex: currentIndex,
        onTap: (index)=>setState(() {
          currentIndex = index;
        }),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.help, size: 28,),
            label: 'Help',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services, size: 28,),
            label: 'Create'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.water_drop, size: 60,),
            label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list, size: 28,),
            label: 'List'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28,),
            label: 'Profile'
          )
        ],
      ),
    );
  }
}
