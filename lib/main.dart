import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repodictionary/provider/repoData.dart';

import './screens/homeScreen.dart';
import './screens/repoScreen.dart';

void main() {
  runApp(const RepoDict());
}

class RepoDict extends StatelessWidget {
  const RepoDict({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepoData(),
      child: MaterialApp(
        title: 'Repo Dictionary',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromRGBO(16, 13, 34, 1),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routes: (ctx) => HomeScreen(),
          RepoScreen.routes: (ctx) => RepoScreen(),
        },
      ),
    );
  }
}
