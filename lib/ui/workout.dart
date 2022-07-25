import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     required this.imagePath,
//     required this.name,
//     required this.instruction,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   final String imagePath, name, instruction;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   var xx = ['Chest', 'Back', 'Shoulder', 'Arms'];
//   var yy = [
//     "Bench press",
//     "Dumbell press",
//     "Dips",
//     "Pull ups",
//     "Deadlift",
//     "Lat pulldown",
//     "Seated Dumbbell Overhead Press",
//     "Dumbbell Lateral Raise",
//     "Incline Dumbbell Reverse Fly",
//     "Hammer Curl",
//     "Close Grip Bench Press",
//     "EZ Bar Skullcrushers",
//   ];
//   var zz = [
//     "assets/4050052-200.png",
//     "assets/2056787-200.png",
//     "assets/3461872-200.png",
//     "assets/2572108-200.png",
//   ];
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: xx[index],
//       expandedValue: yy[index],
//       imagePath: zz[index],
//       instruction: '',
//       name: '',
//     );
//   });
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final List<Item> _data = generateItems(4);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.only(top: 80),
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: Column(
//             children: [
//               for (int i = 0; i < 4; i++)
//                 ListTile(
//                   title: Text(item.expandedValue),
//                   subtitle: const Text(
//                       'To delete this panel, tap the trash can icon'),
//                   trailing: const Icon(Icons.delete),
//                   onTap: () {
//                     setState(() {
//                       _data.removeWhere(
//                           (Item currentItem) => item == currentItem);
//                     });
//                   },
//                   leading: Container(
//                     child: Image.asset(item.imagePath),
//                   ),
//                 ),
//             ],
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }
//          body: ListTile(
//              title: Text(item.expandedValue),
//              subtitle: Text('a'),
//              leading: Container(child: Image.asset(item.imagePath),
//)),
//              //subtitle:
//              //    const Text('To delete this panel, tap the trash can icon'),
//              //trailing: const Icon(Icons.delete),
//              ),
//          isExpanded: item.isExpanded,
//        );
//      }).toList(),
//    );
//  }
//}

class Item {
  Item({
    required this.headerValue,
    required this.subItemValue,
    required this.imagePath,
    required this.name,
    required this.instruction,
    this.isExpanded = false,
  });
  String headerValue;
  List<Map<String, String>> subItemValue;
  final String imagePath, name, instruction;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  var actionList = [
    [
      {
        "title": "Bench press",
        "instruction": "3 sets - 6 repitions",
      },
      {
        "title": "Dumbell press",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "Dips",
        "instruction": "4 sets - 6 repitions",
      }
    ],
    [
      {
        "title": "Pull ups",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "Deadlift",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "Lat pulldown",
        "instruction": "4 sets - 6 repitions",
      }
    ],
    [
      {
        "title": "Seated Dumbbell Overhead Press",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "Dumbbell Lateral Raise",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "Incline Dumbbell Reverse Fly",
        "instruction": "4 sets - 6 repitions",
      }
    ],
    [
      {
        "title": "Hammer Curl",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "Close Grip Bench Press",
        "instruction": "4 sets - 6 repitions",
      },
      {
        "title": "EZ Bar Skullcrushers",
        "instruction": "4 sets - 6 repitions",
      }
    ]
  ];
  var bodypart = [
    {"description": "Chest"},
    {"description": "Back"},
    {"description": "Shoulders"},
    {"description": "Arms"}
  ];
  var imagePathList = [
    "assets/4050052-200.png",
    "assets/2056787-200.png",
    "assets/3461872-200.png",
    "assets/2572108-200.png",
  ];
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: bodypart[index]["description"]!,
      subItemValue: actionList[index],
      imagePath: imagePathList[index],
      instruction: '',
      name: '',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(4);
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16,
            ),
            child: Column(children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white38,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: Text(
                  '${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Upper Body',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "90 mins",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.shutter_speed_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Medium",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
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
              _buildPanel(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Colors.grey.shade900,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            );
          },
          body: Column(
            children: [
              for (int i = 0; i < 3; i++)
                ListTile(
                  title: Text(
                    item.subItemValue[i]["title"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    item.subItemValue[i]["instruction"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Container(
                    child: Image.asset(
                      item.imagePath,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
//          body: ListTile(
//              title: Text(item.expandedValue),
//              subtitle: Text('a'),
//              leading: Container(child: Image.asset(item.imagePath),
//)),
//              //subtitle:
//              //    const Text('To delete this panel, tap the trash can icon'),
//              //trailing: const Icon(Icons.delete),
//              ),
//          isExpanded: item.isExpanded,
//        );
//      }).toList(),
//    );
//  }
//}