import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/ui/workout.dart';
import 'package:my_project/models/meals.dart';
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';
import 'package:sizer/sizer.dart';
import 'package:my_project/ui/mealcard.dart';
import 'package:my_project/ui/radialprogress.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var safepadding = MediaQuery.of(context).padding.top;
    final today = DateTime.now();
    var limitheight =
        (height - kBottomNavigationBarHeight - safepadding) * 0.35;

    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //top element
            Positioned(
              top: 0,
              height:
                  (height - kBottomNavigationBarHeight - safepadding) * 0.35,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40.0),
                ),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 28,
                    right: 16,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          (user.displayName == null)
                              ? 'hi, ${user.email!}'
                              : 'hi, ${user.displayName!}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        trailing: (user.photoURL == null)
                            ? CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/925px-Unknown_person.jpg'),
                              )
                            : CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(user.photoURL!),
                              ),
                      ),
                      Row(
                        children: <Widget>[
                          (limitheight < 207)
                              ? RadialProgress(
                                  width: (width) * 0.3,
                                  height: width * 0.3,
                                  progress: 0.7,
                                )
                              : RadialProgress(
                                  width: (width) * 0.4,
                                  height: width * 0.4,
                                  progress: 0.7,
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _IngredientProgress(
                                  ingredient: 'Protein',
                                  leftAmount: 38,
                                  progress: 0.9,
                                  width: width * 0.27,
                                  progressColor:
                                      Color.fromARGB(255, 149, 106, 223)),
                              SizedBox(
                                height: 10,
                              ),
                              _IngredientProgress(
                                  ingredient: 'Carbs',
                                  leftAmount: 90,
                                  progress: 0.9,
                                  width: width * 0.27,
                                  progressColor:
                                      Color.fromARGB(255, 149, 106, 223)),
                              SizedBox(
                                height: 10,
                              ),
                              _IngredientProgress(
                                  ingredient: 'Fat',
                                  leftAmount: 77,
                                  progress: 0.7,
                                  width: width * 0.27,
                                  progressColor:
                                      Color.fromARGB(255, 149, 106, 223)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //middle element
            Positioned(
              top: (height - kBottomNavigationBarHeight - safepadding) * 0.37,
              left: 0,
              right: 0,
              child: Container(
                height: (height < 670)
                    ? (height - kBottomNavigationBarHeight - safepadding - 14) *
                        0.65
                    : (height - kBottomNavigationBarHeight - safepadding - 14) *
                        0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                        left: 32,
                        right: 16,
                      ),
                      child: Text(
                        'Meals for Today ${height}',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 32,
                            ),
                            for (int i = 0; i < meals.length; i++)
                              MealCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                    ),

                    //bottom element
                    Expanded(
                      child: OpenContainer(
                        closedElevation: 0,
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: Duration(milliseconds: 1000),
                        closedColor: Color(0xFFE9E9E9),
                        openBuilder: (context, _) {
                          return MyStatefulWidget();
                        },
                        closedBuilder: (context, VoidCallback openContainer) {
                          return GestureDetector(
                            onTap: openContainer,
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 15,
                                left: 32,
                                right: 32,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(237, 1, 1, 3),
                                    Colors.black12,
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16,
                                    ),
                                    child: Text(
                                      "YOUR NEXT WORKOUT",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 4.0,
                                      left: 16.0,
                                    ),
                                    child: Text(
                                      "Upper Body",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/4050052-200.png',
                                            width: 40,
                                            height: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/2056787-200.png',
                                            width: 40,
                                            height: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/3461872-200.png',
                                            width: 40,
                                            height: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/2572108-200.png',
                                            width: 40,
                                            height: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
            fontSize: 11.sp,
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
              style: TextStyle(fontSize: 9.5.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
