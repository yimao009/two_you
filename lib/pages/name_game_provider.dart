import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/name_model.dart';
import 'package:two_you_friend/widgets/name_game/random_name_provider.dart';
import 'package:two_you_friend/widgets/name_game/test_other.dart';
import 'package:two_you_friend/widgets/name_game/welcome_provider.dart';

/// 测试随机名字游戏组件
class NameGameProvider extends StatelessWidget {
  /// 设置状态 name
  final name = NameModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeNotifierProvider<NameModel>.value(
          value: name,
          child: Column(
            children: [
              WelcomeProvider(),
              RandomNameProvider(),
            ],
          ),
        ),
        TestOther(),
      ],
    );
  }
}
