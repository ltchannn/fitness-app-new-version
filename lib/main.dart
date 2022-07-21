import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_project/ui/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/ui/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_project/ui/Google_sign_in.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => ChangeNotifierProvider(
              create: (context) => GoogleSignInProvider(),
              child: MaterialApp(
                navigatorKey: navigatorKey,
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                //      home: LoginScreen(),
                home: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ProfileScreen();
                    } else {
                      return AuthScreen();
                    }
                  },
                ),
              ),
            ));
  }
}



//routes: <String, WidgetBuilder>{
//        '/profilescreen': (BuildContext context) => ProfileScreen(),
//      },
// => FROM LOGIN SCREEN ROUTE TO MAINSCREEN
