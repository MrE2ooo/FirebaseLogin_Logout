import 'package:awesome_icons/awesome_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firelogin/core/widgets/CustomButtonWithIcon2.dart';
import 'package:firelogin/widgets/ErrorDialog.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key,required this.onTap  });

  final void Function()? onTap;

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void signUserIn(BuildContext context) async {
  // Show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // Close the loading dialog if still mounted
    if (context.mounted) {
      Navigator.pop(context); // Close the loading dialog
    }
  } on FirebaseAuthException catch (e) {
    print(e);

    // Close the loading dialog if still mounted
    if (context.mounted) {
      Navigator.pop(context); // Close the loading dialog
      // Show error dialog with the error message
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(message: e.message ?? "An unknown error occurred.");
        },
      );
    }
  }
}



    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64.0),
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
                  signUserIn(context);
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
                  Text("Not a member?",style: TextStyle(color: Colors.grey[700]),),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Register now',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                  
                ],
              ),
              const SizedBox(height: 16.0),
              
        const Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: CustomButtonWithIcon2(
                  color: Colors.blue,
                  iconData: FontAwesomeIcons.google,
                  text: 'Log in with ',
                ),
              ),
            ),
            
          ],
        ),
        
            ],
          ),
        ),
      ),
    );
  }
}
