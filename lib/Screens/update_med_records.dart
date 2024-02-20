import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedRecordsPage extends StatefulWidget {
  const MedRecordsPage({super.key});

  @override
  State<MedRecordsPage> createState() => _MedRecordsState();
}

class _MedRecordsState extends State<MedRecordsPage> {
  var record = MedicalRecords(
    gender: 'Male',
    bld_type: 'O+ve',
    height: 1.65,
    weight: 61,
    age: 19,
    diseases: false,
    bp: '120/80',
    diabetes: false,
    thyroid: false,
    hemoglobin: 13.5,
  );

  @override
  Widget build(BuildContext context) {
    final bld_type_controller = TextEditingController(text: record.bld_type);
    final age_controller = TextEditingController(text: record.age.toString());
    final gender_controller = TextEditingController(text: record.gender);
    final height_controller = TextEditingController(text: record.height.toString());
    final weight_controller = TextEditingController(text: record.weight.toString());
    final bp_controller = TextEditingController(text: record.bp);
    final hemoglobin_controller = TextEditingController(text: record.hemoglobin.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('BloodBridge', style: GoogleFonts.openSans()),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update Your Medical Details',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 24.5,
                  ),
                ),
              ),
              Divider(color: Colors.red[800]),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildTextFormField(bld_type_controller, 'Blood Type: '),
                        _buildTextFormField(age_controller, 'Age: '),
                        _buildTextFormField(gender_controller, 'Gender: '),
                        _buildTextFormField(height_controller, 'Height (m): '),
                        _buildTextFormField(weight_controller, 'Weight (kg): '),
                        _buildTextFormField(bp_controller, 'Blood Pressure (e.g., 120/80): '),
                        _buildTextFormField(hemoglobin_controller, 'Hemoglobin (g/dL): '),
                        SwitchListTile(
                          title: Text('Diabetes', style: TextStyle(color: Colors.red[800])),
                          value: record.diabetes,
                          onChanged: (bool value) { setState(() { record.diabetes = value; }); },
                          activeColor: Colors.red,
                        ),
                        SwitchListTile(
                          title: Text('Thyroid', style: TextStyle(color: Colors.red[800])),
                          value: record.thyroid,
                          onChanged: (bool value) { setState(() { record.thyroid = value; }); },
                          activeColor: Colors.red,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Eligibility: ${record.isEligible() ? "You are eligible to donate blood" : 'You are NOT eligible to donate blood'}',
                          style: TextStyle(color: Colors.grey[800], fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        _buildSubmitButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.red[800]),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      ),
    );
  }

  OutlinedButton _buildSubmitButton() {
    return OutlinedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Details updated'),
              );
            }
        );
        // Update record logic
      },
      child: Text('Submit', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.red)),
    );
  }
}

class MedicalRecords {
  String gender, bld_type, bp;
  int age;
  double height, weight, hemoglobin;
  bool diseases, diabetes, thyroid;

  MedicalRecords({
    required this.gender,
    required this.bld_type,
    required this.height,
    required this.weight,
    required this.age,
    required this.diseases,
    required this.bp,
    required this.diabetes,
    required this.thyroid,
    required this.hemoglobin,
  });

  bool isEligible() {
    return age >= 18 && age <= 65 && weight > 45 && !diseases && !diabetes && !thyroid && hemoglobin >= 12.5;
  }
}
