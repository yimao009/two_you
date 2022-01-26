import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/entrance.dart';
import 'package:two_you_friend/project_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Two You',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: ProjectRouter().registerRouter(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Two You'),
          ),
          body: Center(
            child: Entrance(),
          ),
        ));
  }
}
