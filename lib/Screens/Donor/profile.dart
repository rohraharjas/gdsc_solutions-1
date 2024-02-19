import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Services/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  final Donor profile_user = Donor(name: 'testUser', email_id: 'testuser@gmail.com', username: 'usertest', password: '******', location: 'Ghorpadi, Pune', age: 25, weight: 65, blood_type: 'B+ve', gender: 'Male', last_donation_date: '2023/12/12');
 Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(19,8,0,2),
            child: Text(
              'Hello, ${profile_user.name}',
              style: GoogleFonts.ptSerif(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                )
              ),
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey[600],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19,8,0,2),
            child: Text(
              'General User Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
            ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
            child: RichText(text: TextSpan(
              text: 'Username: ',
              style: TextStyle(
                color: Colors.redAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: profile_user.username.substring(3),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ]
            )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
            child: RichText(text: TextSpan(
                text: 'Location: ',
                style: TextStyle(
                  color: Colors.redAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: profile_user.location,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ]
            )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
            child: RichText(text: TextSpan(
                text: 'Age: ',
                style: TextStyle(
                  color: Colors.redAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: profile_user.age.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ]
            )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
            child: RichText(text: TextSpan(
                text: 'Blood Type: ',
                style: TextStyle(
                  color: Colors.redAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: profile_user.age.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ]
            )
            ),
          ),Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
            child: RichText(text: TextSpan(
                text: 'Age: ',
                style: TextStyle(
                  color: Colors.redAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: profile_user.age.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ]
            )
            ),
          ),Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
            child: RichText(text: TextSpan(
                text: 'Age: ',
                style: TextStyle(
                  color: Colors.redAccent[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: profile_user.age.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ]
            )
            ),
          ),
        ],
      ),
    );
  }
}