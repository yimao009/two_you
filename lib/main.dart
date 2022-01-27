import 'package:flutter/material.dart';
// 顶部导航栏
import 'package:two_you_friend/pages/entrance_bottom_bar.dart';

/// 底部导航栏
/// import 'package:two_you_friend/pages/entrance_top_bar.dart';

///
import 'package:two_you_friend/project_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two You',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: ProjectRouter().registerRouter(),
      home: Entrance(),
    );
  }
}
