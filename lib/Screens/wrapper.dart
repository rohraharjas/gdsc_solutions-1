import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/Donor/home_don.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Return according to auth status
    return UserHome();
  }
}
