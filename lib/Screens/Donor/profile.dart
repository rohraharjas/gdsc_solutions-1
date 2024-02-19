import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/userprofile.dart';
import 'package:gdsc_solutions/Services/auth.dart';

class Profile extends StatelessWidget {
  final Donor profileUser = Donor(
    name: 'testUser',
    emailId: 'testuser@gmail.com',
    username: 'usertest',
    password: '******',
    location: 'Ghorpadi, Pune',
    age: 25,
    weight: 65,
    bloodType: 'B+ve',
    gender: 'Male',
    lastDonationDate: '2023/12/12',
    height: 186,
  );
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProfilePage(
      username: profileUser.username,
      name: profileUser.name,
      weight: profileUser.weight,
      gender: profileUser.gender,
      height: profileUser.height,
      age: profileUser.age,
    );
  }
}
