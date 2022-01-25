import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:two_you_friend/inherited_widget/name_inherited_widget.dart';
import 'package:two_you_friend/states/name_states.dart';

/// 欢迎人展示组件
class Welcome extends StatelessWidget {
  /// store
  final Store? store;

  /// 初始化函数
  const Welcome({Key? key, this.store}) : super(key: key);

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('Welcome build');
    return store == null
        ? _build_inherited_widget(context)
        : _build_redux_widget();
  }

  /// [store] 为空展示
  Widget _build_inherited_widget(BuildContext context) {
    final name = NameInheritedWidget.of(context)?.name;
    return Text('欢迎 $name');
  }

  /// [store] 不为空展示
  Widget _build_redux_widget() {
    return StoreConnector<NameStates, String>(
      converter: (store) => store.state.name.toString(),
      builder: (context, name) {
        return Text('欢迎 $name');
      },
    );
  }
}
