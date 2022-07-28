import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:my_project/ui/Google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Container(
                  //color: Colors.black12,
                  height: 15.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black26),
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.red.shade400,
                            child: Icon(
                              Icons.male_outlined,
                              size: 40,
                            ),
                          ),
                          Text(
                            (user.displayName == null)
                                ? user.uid
                                : 'hi, ${user.displayName!}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          Text(
                            user.email!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 55.h,
                      child: ListView(
                        padding: const EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        children: const <Widget>[
                          ListTile(
                            title: Text(
                              "General",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('My Activities'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Membership'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('My Goals'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              'Preferences',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Settings'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('App & Intergration'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Terms of use & privacy policy'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.red.shade900,
                            minimumSize: Size(double.infinity, 70)),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogOut();
                          final snackBar2 = SnackBar(
                            content: Row(
                              children: const <Widget>[
                                FaIcon(FontAwesomeIcons.lock),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Signed out"),
                              ],
                            ),
                          );

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.logout_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Log out from the app',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget snackbar() {
  //   return Scaffold(
  //     body: Center(child: ElevatedButton(
  //        onPressed: () {
  //          FirebaseAuth.instance.signOut();
  //          final provider =
  //              Provider.of<GoogleSignInProvider>(context, listen: false);
  //          provider.googleLogOut();
  //          final snackBar = SnackBar(
  //            content: Row(
  //              children: <Widget>[
  //                FaIcon(FontAwesomeIcons.unlock),
  //                SizedBox(
  //                  width: 8,
  //                ),
  //                Text("Logged out.")
  //              ],
  //            ),
  //            action: SnackBarAction(
  //              label: '',
  //              onPressed: () {},
  //            ),
  //          // Find the ScaffoldMessenger in the widget tree
  //          // and use it to show a SnackBar.
  //          ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //        },
  //        child: const Text('Sign out'),
  //      ),),
  //   );
  // }
}
//  child: ElevatedButton(
//         onPressed: () {
//           FirebaseAuth.instance.signOut();
//           final provider =
//               Provider.of<GoogleSignInProvider>(context, listen: false);
//           provider.googleLogOut();
//           final snackBar = SnackBar(
//             content: Row(
//               children: <Widget>[
//                 FaIcon(FontAwesomeIcons.unlock),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text("Logged out.")
//               ],
//             ),
//             action: SnackBarAction(
//               label: '',
//               onPressed: () {},
//             ),
//           // Find the ScaffoldMessenger in the widget tree
//           // and use it to show a SnackBar.
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: const Text('Sign out'),
//       ),
