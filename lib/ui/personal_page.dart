import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:my_project/ui/Google_sign_in.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('This is personal page'),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       ElevatedButton.icon(
      //         style: ElevatedButton.styleFrom(
      //             primary: Colors.white,
      //             onPrimary: Colors.black,
      //             minimumSize: Size(double.infinity, 70)),
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut();
      //           final provider =
      //               Provider.of<GoogleSignInProvider>(context, listen: false);
      //           provider.googleLogOut();
      //         },
      //         icon: FaIcon(FontAwesomeIcons.unlock),
      //         label: Text("Sign out"),
      //       ),
      //     ],
      //   ),
      // ),
      body: SnackBarPage(),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.googleLogOut();
          final snackBar = SnackBar(
            content: Row(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.unlock),
                SizedBox(
                  width: 8,
                ),
                Text("Logged out.")
              ],
            ),
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Sign out'),
      ),
    );
  }
}
