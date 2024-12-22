import 'package:firebase_auth/firebase_auth.dart';
import 'package:firelogin/HomePage.dart';
import 'package:firelogin/views/LoginOrRegisterView.dart';
import 'package:firelogin/views/signin_view.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            // user is not logged in
            return const Loginorregisterview();
          }
        },
      ),
    );
  }
}
