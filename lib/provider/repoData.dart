import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RepoData extends ChangeNotifier{
  String? _userName;

  String? get getUserName => _userName;

  void changeUserName(String user){
    _userName=user;
    notifyListeners();
  } 
}