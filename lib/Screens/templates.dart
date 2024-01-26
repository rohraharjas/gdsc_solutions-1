import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  const AppTextButton({
    Key? key,
    required this.text,
  }):super(key: key,);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Text(
            text,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          )
        )
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
