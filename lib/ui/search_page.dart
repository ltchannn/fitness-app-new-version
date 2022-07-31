import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/models/coachinfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/coachinfo.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _url = "https://randomuser.me/api/?results=20";
  CoachInfo? coachInfo;
  List<Results>? list = [];

  Future getData() async {
    final response = await http.get(Uri.parse(_url));
    coachInfo = CoachInfo.fromJson(jsonDecode(response.body));

    setState(() {
      list = coachInfo?.results;
      print(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  onSearch(String search) {
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFE9E9E9),
          appBar: AppBar(
            backgroundColor: Color(0xFFE9E9E9),
            title: CupertinoSearchTextField(
              onChanged: (value) => onSearch(value),
              controller: _controller,
              style: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey[850],
              itemColor: Colors.grey.shade500,
            ),
          ),
          body: ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: null,
                                  backgroundImage: NetworkImage(
                                      list![index].picture!.medium.toString()),
                                ))),
                        SizedBox(width: 10),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text((list?[index].name!.first).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text((list?[index].name!.last).toString(),
                                  style: TextStyle(color: Colors.grey[500])),
                            ]),
                      ]),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            list?[index].isClicked = !list![index].isClicked;
                          });
                        },
                        child: AnimatedContainer(
                            height: 35,
                            width: 110,
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                                color: list![index].isClicked
                                    ? Colors.grey[850]
                                    : Color(0xffffff),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: list![index].isClicked
                                      ? Colors.transparent
                                      : Colors.grey.shade700,
                                )),
                            child: Center(
                                child: Text(
                                    list![index].isClicked
                                        ? 'Clicked'
                                        : 'Know More!',
                                    style: TextStyle(
                                        color: list![index].isClicked
                                            ? Colors.white
                                            : Colors.black)))),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
