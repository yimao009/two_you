import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:two_you_friend/inherited_widget/name_inherited_widget.dart';
import 'package:two_you_friend/states/name_states.dart';

/// 随机展示人名
class RandomName extends StatelessWidget {
  /// store
  final Store? store;

  /// 初始化函数
  const RandomName({Key? key, this.store}) : super(key: key);

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('RandomName build');
    return store == null
        ? _build_inherited_widget(context)
        : _build_redux_widget();
  }

  /// [store] 为空展示
  Widget _build_inherited_widget(BuildContext context) {
    final name = NameInheritedWidget.of(context)?.name;
    final Function? changeName = NameInheritedWidget.of(context)?.onNameChange;
    return FlatButton(
      child: Text('$name'),
      onPressed: () => changeName != null ? changeName() : () {},
    );
  }

  /// [store] 不为空展示
  Widget _build_redux_widget() {
    return StoreConnector<NameStates, String>(
      converter: (store) => store.state.name.toString(),
      builder: (context, name) {
        return StoreConnector<NameStates, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(NameActions.changName);
          },
          builder: (context, callback) {
            return ElevatedButton(
              onPressed: () => callback(),
              child: Text(name),
            );
          },
        );
      },
    );
  }
}
