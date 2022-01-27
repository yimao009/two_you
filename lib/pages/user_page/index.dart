import 'package:flutter/material.dart';
import 'package:two_you_friend/util/tools/json_config.dart';

/// 首页
class UserPageIndex extends StatelessWidget {
  /// 用户 ID 信息
  final String? userId;

  /// 构造函数
  const UserPageIndex({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取参数
    Map dataInfo = JsonConfig.objectToMap(
        ModalRoute.of(context)!.settings.arguments as Map);

    // TODO: implement build
    return Text('I am use page ${dataInfo['userId']}');
  }
}
