import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/templates.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Colors.red.shade600,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter your Phone Number and OTP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              PhoneNumberField(),
              const SizedBox(height: 20),
              OTPField(),
              const SizedBox(height: 40),
              AppTextButton(
                text: "Submit",
                height: 100.0,
                width: double.infinity,
                onpressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        // Add any additional validation here
        return null;
      },
    );
  }
}

class OTPField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'OTP',
        hintText: 'Enter the OTP',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the OTP';
        }
        // Add any additional validation here
        return null;
      },
    );
  }
}
