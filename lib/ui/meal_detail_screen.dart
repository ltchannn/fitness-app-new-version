import 'package:my_project/models/meals.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Widgets/video.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      switch (orientation) {
        case Orientation.portrait:
          return Scaffold(
              backgroundColor: Color.fromARGB(255, 14, 13, 13),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      snap: true,
                      floating: true,
                      backgroundColor: Colors.white,
                      expandedHeight: 300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40)),
                          child: Image.asset(
                            meal.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Text(
                              meal.mealTime,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                            subtitle: Text(
                              meal.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${meal.timeTaken} mins',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${meal.kiloCaloriesBurnt} kcal',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'INGREDIENTS',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                for (int i = 0;
                                    i < meal.ingredients.length;
                                    i++)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 6.0,
                                    ),
                                    child: Text(
                                      meal.ingredients[i],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'PREPARATION',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //VideoScreen(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 32,
                            ),
                            child: Text(
                              meal.preparation,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'RECIPE',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Video(meal: meal)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
          break;
        case Orientation.landscape:
          return Video(meal: meal);
          break;
      }
    });
  }
}

// return Scaffold(
//         backgroundColor: Color.fromARGB(255, 14, 13, 13),
//         body: SafeArea(
//           child: CustomScrollView(
//             slivers: <Widget>[
//               SliverAppBar(
//                 snap: true,
//                 floating: true,
//                 backgroundColor: Colors.white,
//                 expandedHeight: 300,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(40))),
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: ClipRRect(
//                     borderRadius:
//                         BorderRadius.vertical(bottom: Radius.circular(40)),
//                     child: Image.asset(
//                       meal.imagePath,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ListTile(
//                       title: Text(
//                         meal.mealTime,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 18,
//                           color: Colors.blueGrey,
//                         ),
//                       ),
//                       subtitle: Text(
//                         meal.name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 24,
//                           color: Colors.white,
//                         ),
//                       ),
//                       trailing: Padding(
//                         padding: const EdgeInsets.only(top: 3.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             SizedBox(
//                               height: 2,
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.access_time,
//                                   color: Colors.black,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '${meal.timeTaken} mins',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 SizedBox(
//                                   width: 25,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       '${meal.kiloCaloriesBurnt} kcal',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         'INGREDIENTS',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.blueGrey,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           for (int i = 0; i < meal.ingredients.length; i++)
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 bottom: 6.0,
//                               ),
//                               child: Text(
//                                 meal.ingredients[i],
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w300,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         'PREPARATION',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.blueGrey,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     //VideoScreen(),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: 16,
//                         right: 16,
//                         bottom: 32,
//                       ),
//                       child: Text(
//                         meal.preparation,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 10,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         'RECIPE',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.blueGrey,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: SizedBox(
//                           width: double.infinity,
//                           height: MediaQuery.of(context).size.height * 0.25,
//                           child: Video(meal: meal)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));