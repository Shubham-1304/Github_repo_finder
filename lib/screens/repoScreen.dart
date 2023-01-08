import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../widgets/repoList.dart';
import '../widgets/searchbar.dart';

class RepoScreen extends StatefulWidget {
  static String routes = '/repo';
  const RepoScreen({super.key});

  @override
  State<RepoScreen> createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
          RepoList(),
        ],
      ),
    );
  }
}
