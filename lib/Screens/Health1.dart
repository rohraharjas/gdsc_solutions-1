import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  const Health({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // First column
                  Container(
                    margin: EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(6.0),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(120, 60), // Adjust size as needed
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Did you know?',
                        style: TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),

                      ),

                    ),
                  ),
                  // Second column
                  Container(
                    margin: EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(6.0),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(120, 60), // Adjust size as needed
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Doctors & Dieticians',
                        style: TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),

                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              const Column(
                  children:[
                    Row(
                        children:[
                          Text(
                            'SwifTip for the day:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ]
                    ),

                    Row(
                        children:[
                          Text(
                            'Just 1 donation can save upto 3 lives!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ]
                    )
                  ]
              ),
            ],
          ),
        )


        ),



    );
  }
}