import 'package:flutter/material.dart';

import '../screens/repoScreen.dart';
import '../widgets/custom_text.dart';

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
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(16, 13, 34, 1),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 2,
                            color: Colors.blue,
                          )
                        ],
                      ),
              child: CustomText(text: 'Repo-Directory',shadow: [
                Shadow(color: Colors.blue),
              ],
              fontSize: 20,
              fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(RepoScreen.routes),
              child: Text('Check Repo'),
            ),
          ],
        ),
      ),
    );
  }
}
