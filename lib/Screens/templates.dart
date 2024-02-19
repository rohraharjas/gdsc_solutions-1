import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextButton extends StatefulWidget {
  final String text;
  final double height, width;
  final GestureTapCallback onpressed;
  const AppTextButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onpressed,
  });

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: widget.width,
      height: widget.height,
      child: OutlinedButton(
        onPressed: widget.onpressed,
        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red)),
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

