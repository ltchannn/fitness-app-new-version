import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/models/meals.dart';
import 'package:my_project/ui/personal_page.dart';
import 'package:my_project/ui/search_page.dart';
import 'package:flutter/material.dart';
import 'package:my_project/ui/home_page.dart';
import 'package:my_project/models/meals.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  final screens = [
    HomeScreen(),
    SearchScreen(),
    PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientaion) {
      switch (orientaion) {
        case Orientation.portrait:
          return Scaffold(
            body: screens[currentIndex],
            backgroundColor: Color(0xFFE9E9E9),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              child: BottomNavigationBar(
                onTap: (index) {
                  setState(
                    () => currentIndex = index,
                  );
                },
                currentIndex: currentIndex,
                iconSize: 30,
                selectedIconTheme: IconThemeData(
                  color: Colors.orange,
                ),
                unselectedIconTheme: IconThemeData(color: Colors.black12),
                selectedLabelStyle: TextStyle(color: Colors.black),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'personal',
                  ),
                ],
                selectedItemColor: Colors.black,
              ),
            ),
          );

          break;

        case Orientation.landscape:
          return Scaffold(
            body: screens[currentIndex],
          );
          break;
      }
    });
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final double leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key? key,
      required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.progressColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${leftAmount}g left",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
