import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextButton extends StatefulWidget {
  final String text;
  final double height, width;
  final VoidCallback onpressed;
  const AppTextButton({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    required this.onpressed,
  }):super(key: key,);

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
          child: Text(
              widget.text,
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.red)
          ),
      ),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar({super.key}) : super(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: Colors.red[800],
    title: Center(
      child: Text(
          'BloodBridge',
          style: GoogleFonts.lora(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
    ),
    actions: <Widget>[
      IconButton(onPressed: () {},
          icon: const Icon(Icons.logout_outlined, color: Colors.white,))
    ],
  );
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var titles = [ 'Home', 'Events', 'Profile','FAQs', 'Medical Assistance', 'Update Medical Records'];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red[800],
          ),
          child: const Text(
            'Hello ;p',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        )] + (titles.map(
                (x) => ListTile(
              title: Text(
                x,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            )
        ).toList()),
      ),
    );
  }
}



