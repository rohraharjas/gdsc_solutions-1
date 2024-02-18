import 'package:flutter/material.dart';
import './authenticate/authenticate.dart';
import 'package:gdsc_solutions/main.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  static bool _signInStatus = false;

  @override
  Widget build(BuildContext context) {
    //Return according to auth status
    return (_signInStatus) ? Home(currentIndex: 2) : const SignInPage2();
  }

  static void signIn(bool val) {
    _signInStatus = val;
  }
}
