import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget implements PreferredSizeWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  onSearch(String search) {
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFE9E9E9),
      elevation: 0,
      title: Container(
        height: 5.h,
        child: TextField(
          controller: _controller,
          onChanged: (value) => onSearch(value),
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
            suffixIcon: IconButton(
              onPressed: () => _controller.clear(),
              icon: Icon(
                Icons.clear,
                color: Colors.grey.shade500,
              ),
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
    );
  }
}
