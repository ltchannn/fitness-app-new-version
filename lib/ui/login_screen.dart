import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_project/main.dart';
import 'package:my_project/ui/Google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:my_project/models/coachinfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.SignUp}) : super(key: key);

  final VoidCallback SignUp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  final _url = "https://randomuser.me/api/?results=20";
  CoachInfo? coachInfo;
  List<Results>? list = [];

  var _isObscure = true;
  FocusNode myFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              Container(
                height: (size.height - 65) * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Hi user, \n welcome back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Form(
                        key: formkey1,
                        child: TextFormField(
                          //focusNode: myFocusNode,
                          cursorColor: Colors.black,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '\u26A0 A valid email is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Form(
                        key: formkey2,
                        child: TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '\u26A0 Password must be 6 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                child: _isObscure
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.visibility_outlined)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Forgot your password?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.SignUp,
                            text: " Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: (size.height - 60) * 0.5,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueGrey,
                                Color(0xFF92A3FD),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade900,
                                onPrimary: Colors.white,
                                minimumSize: Size(double.infinity, 70)),
                            onPressed: () {
                              final snackBar1 = SnackBar(
                                content: Row(
                                  children: <Widget>[
                                    FaIcon(FontAwesomeIcons.lock),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Logged in"),
                                  ],
                                ),
                              );
                              login();
                              //getData();

                              FirebaseAuth.instance
                                  .authStateChanges()
                                  .listen((User? user) {
                                if (user != null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar1);
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.arrow_forward_sharp),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Flexible(
                          child: Divider(
                            thickness: 0.8,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Divider(
                            thickness: 0.8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity, 70)),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                          //getData();
                          final snackBar2 = SnackBar(
                            content: Row(
                              children: const <Widget>[
                                FaIcon(FontAwesomeIcons.lock),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Signed in"),
                              ],
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            FaIcon(FontAwesomeIcons.google),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);

    formkey1.currentState!.validate();
    formkey2.currentState!.validate();
  }

  // Future getData() async {
  //   final response = await http.get(Uri.parse(_url));
  //   coachInfo = CoachInfo.fromJson(jsonDecode(response.body));

  //   setState(() {
  //     list = coachInfo?.results;
  //     print(response.body);
  //   });
  // }
}

// GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               // Toggle light when tapped.
//                               login();
//                             });
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Icon(
//                                 Icons.arrow_forward_sharp,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Login",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               // error msg????
//                             ],
//                           ),
//                         ),