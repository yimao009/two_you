import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/pages/entrance.dart';
import 'package:two_you_friend/project_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LikeNumModel>.value(
      value: LikeNumModel(),
      child: MaterialApp(
        title: 'Two You',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: ProjectRouter().registerRouter(),
        home: Entrance(),
      ),
    );
  }
}
