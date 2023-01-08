import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/repoData.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(16, 13, 34, 1),
          filled: true,
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Colors.white,
          hintText: "Search Github User",
        ),
        onEditingComplete: () {
          print("function called");
          print(searchController.text);
          Provider.of<RepoData>(context, listen: false).changeUserName(searchController.text);
        },
      ),
    );
  }
}
