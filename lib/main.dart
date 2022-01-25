import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/name_game_provider.dart';

void main() {
  final store = runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two you',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Two You'),
        ),
        body: Center(
          child: NameGameProvider(),
        ),
      ),
    );
  }
}
