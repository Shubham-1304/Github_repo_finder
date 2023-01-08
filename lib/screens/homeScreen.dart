import 'package:flutter/material.dart';

import '../screens/repoScreen.dart';

class HomeScreen extends StatelessWidget {
  static String routes = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('START'),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(RepoScreen.routes),
              child: Text('Check Repo'),
            ),
          ],
        ),
      ),
    );
  }
}
