import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './custom_text.dart';
import './lastCommitdetails.dart';

class SingleRepo extends StatelessWidget {
  final String? projectName;
  final String? projectUrl;
  final String? description;
  final String? userName;

  SingleRepo({
    @required this.projectName,
    @required this.projectUrl,
    @required this.description,
    @required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          CustomText(
            text: "Project:  ${projectName}",
            shadow: [
              Shadow(color: Colors.blue),
            ],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text: "Description:  ${description}",
            shadow: [
              Shadow(color: Colors.blue),
            ],
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text: 'Project URL',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(projectUrl!);
                    },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child:
                LastCommitDetails(repoName: projectName, userName: userName),
            elevation: 8,
            color: Color.fromARGB(255, 253, 5, 5),
          )
        ],
      ),
    );
  }
}
