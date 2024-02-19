import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  // Dummy user data (replace with actual user data)
  final String username = "user123";
  final String name = "Ayush Chanekar";
  final double weight = 76.8;
  final String gender = "Male"; // Change this to "Other" for testing
  final double height = 187.9;
  final int age = 30;
  Widget _gap() => const SizedBox(
        height: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User Profile",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              _gap(),
              buildProfileCard(
                'Username',
                username,
                // Icons.alternate_email_rounded,
                Icons.attribution_rounded,
              ),
              _gap(),
              buildProfileCard(
                'Name',
                name,
                Icons.account_circle,
              ),
              _gap(),
              buildProfileCard(
                'Weight (kg)',
                weight.toString(),
                Icons.monitor_weight,
              ),
              _gap(),
              buildProfileCard(
                'Gender',
                gender,
                Icons.wc,
              ),
              _gap(),
              buildProfileCard(
                'Height (cm)',
                height.toString(),
                Icons.height,
              ),
              _gap(),
              buildProfileCard(
                'Age (years)',
                age.toString(),
                Icons.cake,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileCard(String title, String subtitle, IconData iconData) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(iconData, size: 40),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
