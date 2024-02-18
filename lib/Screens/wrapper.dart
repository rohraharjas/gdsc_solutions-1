import 'package:flutter/material.dart';
import 'package:gdsc_solutions/main.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Return according to auth status
    return Home(
      currentIndex: 0,
    );
  }
}
