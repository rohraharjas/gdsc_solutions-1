import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String username;
  final String name;
  final double weight;
  final String gender;
  final int height;
  final int age;

  const UserProfilePage({
    super.key,
    required this.username,
    required this.name,
    required this.weight,
    required this.gender,
    required this.height,
    required this.age,
  });

  Widget _gap() => const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background to contrast with red theme
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50, // Profile picture size
                  backgroundImage: NetworkImage('assets/images/doctor1.jpg'), // Placeholder image
                  backgroundColor: Colors.red.shade100, // Light red background for the avatar
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "User Profile",
                style: TextStyle(
                  color: Colors.redAccent, // Maintain red theme for the header
                  fontWeight: FontWeight.bold,
                  fontSize: 28, // Increased font size for prominence
                ),
              ),
              _gap(),
              buildProfileCard(
                'Username',
                username,
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
                'Gender',
                gender,
                _getGenderIcon(gender),
              ),
              _gap(),
              buildProfileCard(
                'Age (years)',
                age.toString(),
                Icons.cake,
              ),
              _gap(),
              buildProfileCard(
                'Weight (kg)',
                weight.toString(),
                Icons.monitor_weight,
              ),
              _gap(),
              buildProfileCard(
                'Height (cm)',
                height.toString(),
                Icons.height,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileCard(String title, String subtitle, IconData iconData) {
    return Card(
      elevation: 5, // Slight elevation for depth
      shadowColor: Colors.red.shade100, // Soft red shadow for depth
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Rounded corners for a modern look
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(iconData, size: 40, color: Colors.redAccent), // Icon with red accent
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.redAccent, // Red text for title
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)), // Subdued color for the subtitle
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getGenderIcon(String gender) {
    // Choose icon based on gender and maintain red theme
    if (gender == 'Male') {
      return Icons.male; // Consider color customization if needed
    } else if (gender == 'Female') {
      return Icons.female; // Consider color customization if needed
    } else {
      return Icons.transgender; // Consider color customization if needed
    }
  }
}
