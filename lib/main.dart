import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:two_you_friend/pages/name_game_redux.dart';
import 'package:two_you_friend/states/name_states.dart';

void main() {
  final store =
      Store<NameStates>(reducer, initialState: NameStates.initState());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<NameStates> store;
  MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<NameStates>(
      store: store,
      child: MaterialApp(
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
            child: NameGameRedux(store: store),
          ),
        ),
      ),
    );
  }
}
