import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(19, 8, 0, 2),
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[800],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //Padding(padding: EdgeInsets.all(8.0),
                children: [
                  const Text(
                    '1. Why should I donate blood?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  _gap(),
                  const Text(
                    'Donating blood can save lives by providing a critical resource for patients undergoing surgeries, treatments for diseases like cancer, and those experiencing trauma or emergencies. Its a simple way to contribute to the health and well-being of your community.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  _gap(),
                  const Text(
                    '2. How often can I donate blood?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  _gap(),
                  const Text(
                    'The frequency of blood donation varies depending on regulations of your country, and your health status. Typically, healthy individuals can donate whole blood every 56 days, or double red blood cells every 112 days. However, its essential to follow the guidelines provided by the blood donation center or health authorities.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  _gap(),
                  const Text(
                    '3. Is blood donation safe?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _gap(),
                  const Text(
                    'Yes, blood donation is safe for most people. Blood donation centers follow strict protocols to ensure the safety of donors and recipients. Donors are screened for eligibility, and sterile equipment is used for each donation to prevent the risk of infection.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  _gap(),
                  const Text(
                    '4. How long does a blood donation appointment take?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _gap(),
                  const Text(
                    'The duration of a blood donation appointment can vary, but typically it takes about 30 minutes to one hour. This includes registration, a brief medical history questionnaire, a mini-physical examination, the donation process itself, and post-donation refreshments and recovery time.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  _gap(),
                  const Text(
                    '5. Can I donate blood if I have a medical condition or take medications?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _gap(),
                  const Text(
                    'The duration of a blood donation appointment can vary, but typically it takes about 30 minutes to one hour. This includes registration, a brief medical history questionnaire, a mini-physical examination, the donation process itself, and post-donation refreshments and recovery time.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  _gap(),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _gap() => const SizedBox(
        height: 20,
      );
}
