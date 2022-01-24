import 'package:flutter/material.dart';
import 'package:two_you_friend/inherited_widget/name_inherited_widget.dart';

/// 随机展示人名
class RandomName extends StatelessWidget {
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final name = NameInheritedWidget.of(context)?.name;
    final Function? changeName = NameInheritedWidget.of(context)?.onNameChange;

    return FlatButton(
      child: Text('$name'),
      onPressed: () => changeName != null ? changeName() : () {},
    );
  }
}
