import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:convert';
import './singleRepo.dart';
import './custom_text.dart';
import '../provider/repoData.dart';

class RepoList extends StatefulWidget {
  @override
  State<RepoList> createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  bool flag = false;
  List<dynamic>? allRepo;
  String? user;
  void getData() {
    setState(() {
      flag = false;
    });
    final url = Uri.parse('https://api.github.com/users/${user}/repos');
    http.get(url).then((value) {
      setState(() {
        allRepo = json.decode(value.body);
      });
    });
    Timer(Duration(seconds: 7), () {
      setState(() {
        flag = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // getData("freeCodeCamp");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    RepoData repo = Provider.of<RepoData>(context);
    if (user != repo.getUserName) {
      setState(() {
        user = repo.getUserName;
        getData();
      });
    }
    final size = MediaQuery.of(context).size;
    return allRepo == null
        ? flag == false
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  children: [
                    CustomText(
                      text: "Check Internet Connection.",
                      shadow: [
                        Shadow(color: Colors.blue),
                      ],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("function in repolist called");
                        // print(repo.getUserName);
                        getData();
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              )
        : allRepo!.length == 0
            ? Center(
                child: Text("No Repository Found"),
              )
            : ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.7),
                child: ListView.builder(
                  itemCount: allRepo!.length,
                  itemBuilder: ((context, index) {
                    return SingleRepo(
                      projectName: allRepo![index]['name'],
                      projectUrl: allRepo![index]['html_url'],
                      description: allRepo![index]['description'],
                      userName: allRepo![index]['owner']['login'],
                    );
                  }),
                ),
              );
  }
}
