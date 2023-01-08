import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:http/http.dart' as http;

import './custom_text.dart';
import 'dart:convert';

class LastCommitDetails extends StatefulWidget {
  final String? repoName;
  final String? userName;
  bool flag = false;

  LastCommitDetails({
    @required this.repoName,
    @required this.userName,
  });

  @override
  State<LastCommitDetails> createState() => _LastCommitDetailsState();
}

class _LastCommitDetailsState extends State<LastCommitDetails> {
  List<dynamic>? lastCommit;
  String? date;
  String? time;

  void getCommitData() {
    final url = Uri.parse(
        'https://api.github.com/repos/${widget.userName}/${widget.repoName}/commits');
    http.get(url).then((value) {
      setState(() {
        lastCommit = json.decode(value.body);
        final dt = lastCommit![0]["commit"]["committer"]["date"]
            .split(new RegExp(r"[A-Z]"));
        date = dt[0];
        time = dt[1];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCommitData();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: ExpandableThemeData(iconColor: Colors.white),
      header: CustomText(
        text: "Last Commit Details",
        shadow: [
          Shadow(color: Colors.blue),
        ],
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      collapsed: Container(),
      expanded: lastCommit == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : lastCommit!.length == 0
              ? Center(
                  child: Text("No Commit Found"),
                )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          "Committed by:  ${lastCommit![0]["commit"]["committer"]["name"]}",
                      shadow: [
                        Shadow(color: Colors.blue),
                      ],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Date:  ${date}, Time: ${time}",
                      shadow: [
                        Shadow(color: Colors.blue),
                      ],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Message:  ${lastCommit![0]["commit"]["message"]}",
                      shadow: [
                        Shadow(color: Colors.blue),
                      ],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
    );
  }
}
