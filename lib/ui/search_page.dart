import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:my_project/videos/video.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE9E9E9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFE9E9E9),
          title: Container(
            height: 5.h,
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: AAAAA(),
        ),
      ),
    );
  }
}
