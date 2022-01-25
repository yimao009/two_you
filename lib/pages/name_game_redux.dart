import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:two_you_friend/widgets/name_game/random_name.dart';
import 'package:two_you_friend/widgets/name_game/test_other.dart';
import 'package:two_you_friend/widgets/name_game/welcome.dart';

/// 测试随机名字游戏组件
class NameGameRedux extends StatelessWidget {
  /// store
  final Store store;

  /// 构造函数
  const NameGameRedux({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('NameGameRedux build');
    return Column(
      children: [
        Welcome(store: store),
        RandomName(store: store),
        TestOther(),
      ],
    );
  }
}
