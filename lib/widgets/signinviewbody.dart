import 'package:firebase_auth/firebase_auth.dart';
import 'package:firelogin/widgets/ErrorDialog.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void signUserUp() async {
      // show loading circle
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // sign in impl
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        
      }

      //pop the circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In Account',
              style: TextStyle(
                fontSize: 30, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0), // Space between title and text fields
            SizedBox(
              width: screenWidth * 0.8,
              height: 100,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: screenWidth * 0.8,
              height: 100,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                signUserUp();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
              ),
              child:
                  const Text('Sign In', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    // Navigate to login page or handle login action
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
