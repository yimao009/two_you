import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/name_model.dart';

/// 随机展示人名
class RandomNameProvider extends StatelessWidget {
  /// 初始化函数
  const RandomNameProvider({Key? key}) : super(key: key);

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('RandomName build');
    final _name = Provider.of<NameModel>(context);
    return ElevatedButton(
      child: Text('${_name.value}'),
      onPressed: () => _name.changName(),
    );
  }
}
