import 'package:flutter/material.dart';
import 'package:gdsc_solutions/Screens/authenticate/forgotpassword.dart';
import 'package:gdsc_solutions/Screens/templates.dart';
import 'package:gdsc_solutions/main.dart';
import '../wrapper.dart';

class SignInPage2 extends StatelessWidget {
  const SignInPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
              child: isSmallScreen
                  ? const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _Logo(),
                        _FormContent(),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.all(32.0),
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: const Row(
                        children: [
                          Expanded(child: _Logo()),
                          Expanded(
                            child: Center(child: _FormContent()),
                          ),
                        ],
                      ),
                    )),
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: isSmallScreen ? 100 : 200,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to BloodBridge!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isFirstCardRed = false;
  bool _isSecondCardRed = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(
                      () {
                        _isPasswordVisible = !_isPasswordVisible;
                      },
                    );
                  },
                ),
              ),
            ),
            _gap(),
            const Text(
              "I am a: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFirstCardRed = true;
                        _isSecondCardRed = false;
                      });
                    },
                    child: Card(
                      color:
                          _isFirstCardRed ? Colors.red.shade500 : Colors.white,
                      child: const ListTile(
                        title: Text('Donor'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFirstCardRed = false;
                        _isSecondCardRed = true;
                      });
                    },
                    child: Card(
                      color:
                          _isSecondCardRed ? Colors.red.shade500 : Colors.white,
                      child: const ListTile(
                        title: Text('Organisation'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _gap(),
            Row(
              children: <Widget>[
                Flexible(
                  child: CheckboxListTile(
                    value: _rememberMe,
                    onChanged: (value) {
                      if (value != null) {
                        setState(
                          () {
                            _rememberMe = value;
                          },
                        );
                      }
                    },
                    title: const Text('Remember me'),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            _gap(),
            AppTextButton(
              text: "Submit",
              height: 100.0,
              width: double.infinity,
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(currentIndex: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
