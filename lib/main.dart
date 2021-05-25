//region imports

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/data/repo/AppDetailRepo.dart';
import 'package:flutter_punjabilearning/ui/activities/DashBoardScreen.dart';
import 'package:flutter_punjabilearning/ui/activities/LoginScreen.dart';
import 'package:flutter_punjabilearning/utils/SharedPref.dart';

/// This variable is used to get dynamic colors when theme mode is changed

void main() async {
//region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
//endregion
}

const iOSLocalizedLabels = false;

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String _textFromFile = "";
  var apprepo = AppRepo();
  MyAppState() {
    getlogintoken().then((val) {
      setState(() {
        _textFromFile = val;
      });
    });
  }
  Future<String> getlogintoken() async {
    {
      var login = await SharedPreferencesTest().checkIsLogin("1");
      return login;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    apprepo.appdetail(context).then((value) {
      SharedPreferencesTest().applogo("0", value.data.logo);
    }).catchError((onError) {});
  }

  @override
  Widget build(BuildContext context) {
    if (_textFromFile == "true") {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [Locale('en', '')],
        home: HomeScreen(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [Locale('en', '')],
        home: LoginScreen(),
      );
    }
  }
}
