import 'package:flutter/material.dart';
import 'package:my_project/videos/video.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientaion) {
      switch (orientaion) {
        case Orientation.portrait:
          return SafeArea(
            child: Scaffold(
              appBar: Search(),
              backgroundColor: Color(0xFFE9E9E9),
              body: Center(
                child: Video(),
              ),
            ),
          );

          // TODO: Handle this case.
          break;
        case Orientation.landscape:
          return Video();

// TODO: Handle this case.
          break;
      }
    });
    // return SafeArea(
    //   child: Scaffold(
    //     appBar: Search(),
    //     backgroundColor: Color(0xFFE9E9E9),
    //     body: Center(
    //       child: Video(),
    //     ),
    //   ),
    // );
  }
}
