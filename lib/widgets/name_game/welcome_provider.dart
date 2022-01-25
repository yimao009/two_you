import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/name_model.dart';

/// 欢迎人展示组件
class WelcomeProvider extends StatelessWidget {
  /// 初始化函数
  const WelcomeProvider({Key? key}) : super(key: key);

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('Welcome build');
    final _name = Provider.of<NameModel>(context);
    return Text('欢迎 ${_name.value}');
  }
}
