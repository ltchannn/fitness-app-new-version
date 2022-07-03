import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_project/ui/meal_detail_screen.dart';
import 'package:my_project/ui/personal_page.dart';
import 'package:my_project/ui/search_page.dart';
import 'package:my_project/ui/yyy.dart';
import 'package:flutter/material.dart';
import 'package:my_project/models/meals.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';
import 'package:my_project/ui/login_screen.dart';
import 'package:my_project/ui/Google_sign_in.dart';
import 'package:animations/animations.dart';

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
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              height: height * 0.35,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: const Radius.circular(40.0),
                ),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 32,
                    right: 16,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}',
                          style: const TextStyle(
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
                        trailing: ClipOval(
                          child: Image.asset("assets/unknown.png"),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          _RadialProgress(
                            width: width * 0.4,
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
            Positioned(
              top: height * 0.35,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.5,
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
                        'Meals for Today',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
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
                              _MealCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
                                bottom: 20,
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

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({
    super.key,
    required this.height,
    required this.width,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "1234",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurple[900],
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple[900],
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    //canvas.drawCircle(center, size.width / 2, paint);

    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(0), math.radians(relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(_RadialPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_RadialPainter oldDelegate) => false;
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealDetailScreen(
                meal: meal,
              ),
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 4,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      meal.imagePath,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 0,
                          ),
                          Text(
                            meal.mealTime,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            meal.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${meal.kiloCaloriesBurnt} kcal',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 15,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${meal.timeTaken} mins",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
