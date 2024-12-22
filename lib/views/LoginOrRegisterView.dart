import 'package:firelogin/views/RegisterView.dart';
import 'package:firelogin/views/signin_view.dart';
import 'package:flutter/material.dart';

class Loginorregisterview extends StatefulWidget {
  const Loginorregisterview({super.key});

  @override
  State<Loginorregisterview> createState() => _LoginorregisterviewState();
}

class _LoginorregisterviewState extends State<Loginorregisterview> {
  // show login page initially
  bool showLoginPage = true;

  // toggle between login and redister page
  void togglePages() {
    print("Toggling pages");
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInView(
        onTap: togglePages,
      );
    } else {
      return const RegisterView();
    }
    
  }
}
