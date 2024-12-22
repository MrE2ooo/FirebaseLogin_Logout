

import 'package:firelogin/widgets/signinviewbody.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SignInViewBody(onTap: widget.onTap,)
    );
  }
}