import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Widgets/video.dart';
import 'package:my_project/models/meals.dart';
import 'package:my_project/models/user.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/search.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _controller = TextEditingController();

  List<User> _users = [
    User(
        'Elliana Palacios',
        '@elliana',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    User(
        'Kayley Dwyer',
        '@kayley',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    User(
        'Kathleen Mcdonough',
        '@kathleen',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    User(
        'Kathleen Dyer',
        '@kathleen',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Kiersten Lange',
        '@kiersten',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Carys Metz',
        '@metz',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Ignacio Schmidt',
        '@schmidt',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Clyde Lucas',
        '@clyde',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    //print(search);
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
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
        body: Container(
          height: (MediaQuery.of(context).size.height -
              kBottomNavigationBarHeight -
              MediaQuery.of(context).padding.top),
          color: Color(0xFFE9E9E9),
          child: _foundedUsers.isNotEmpty
              ? ListView.builder(
                  itemCount: _foundedUsers.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: userComponent(user: _foundedUsers[index]),
                    );
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.white),
                )),
        ),
      ),
    );

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

  userComponent({required User user}) {
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
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(user.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: user.isFollowedByMe
                        ? Colors.grey[850]
                        : Color(0xffffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: user.isFollowedByMe
                          ? Colors.transparent
                          : Colors.grey.shade700,
                    )),
                child: Center(
                    child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
                        style: TextStyle(
                            color: user.isFollowedByMe
                                ? Colors.white
                                : Colors.black)))),
          )
        ],
      ),
    );
  }
}
