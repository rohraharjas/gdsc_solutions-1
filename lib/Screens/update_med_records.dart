import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/templates.dart';
import 'package:gdsc_solutions/main.dart';
import 'package:google_fonts/google_fonts.dart';

class MedRecordsPage extends StatefulWidget {
  const MedRecordsPage({super.key});

  @override
  State<MedRecordsPage> createState() => _MedRecordsState();
}

class _MedRecordsState extends State<MedRecordsPage> {
  var record = MedicalRecords(gender: 'Male', bld_type: 'O+ve', height: 1.65, weight: 61, age: 19, diseases: false);

  @override
  Widget build(BuildContext context) {
    final bld_type_controller = TextEditingController(text: record.bld_type);
    final age_controller = TextEditingController(text: record.age.toString());
    final gender_controller = TextEditingController(text: record.gender);
    final height_controller = TextEditingController(text: record.height.toString());
    final weight_controller = TextEditingController(text: record.weight.toString());
    return Scaffold(
      appBar: MyAppBar(context: context,),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(19, 8, 19, 2),
            child: Column(
              children: [
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Your Medical Details',
                      style: TextStyle(
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 24.5
                      ),
                    ),
                    Divider(),
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: bld_type_controller,
                            decoration: const InputDecoration(
                                labelText: 'Blood Type: ',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: age_controller,
                            decoration: const InputDecoration(
                                labelText: 'Age: ',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: gender_controller,
                            decoration: const InputDecoration(
                              labelText: 'Gender: ',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: height_controller,
                            decoration: const InputDecoration(
                                labelText: 'Height: ',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: weight_controller,
                            decoration: const InputDecoration(
                                labelText: 'Weight: ',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: 'Eligibility: ',
                              style: TextStyle(color: Colors.red[600]),
                              children: [
                                TextSpan(
                                  text: (record.isEligible())?"You are eligible to donate blood":'You are NOT eligible to donate blood',
                                  style: TextStyle(color: Colors.grey[800])
                                )
                              ]
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                      ),
                SizedBox(height: 10,),
                OutlinedButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: Text('Details updated'),
                      );
                    });
                    setState(() {
                      record.bld_type = bld_type_controller.text.toString();
                      record.age = int.parse(age_controller.text);
                      record.gender = gender_controller.text.toString();
                      record.height = double.parse(height_controller.text);
                      record.weight = double.parse(weight_controller.text);
                    });
                  },
                  child: Text('Submit',
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.red)),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class MedicalRecords{
  String gender, bld_type;
  int age;
  double height, weight;
  bool diseases;

  MedicalRecords({
    required this.gender,
    required this.bld_type,
    required this.height,
    required this.weight,
    required this.age,
    required this.diseases,
});
  bool isEligible(){
    return (age>=18&&age<=65&&weight>45&&!diseases);
  }
}
