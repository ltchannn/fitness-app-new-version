import 'package:flutter/material.dart';
import 'package:my_project/ui/login_screen.dart';
import 'package:my_project/ui/profile_screen.dart';
import 'package:my_project/ui/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(
          SignUp: toggle,
        )
      : SignUpScreen(SignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
