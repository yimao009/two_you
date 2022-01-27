import 'package:flutter/material.dart';

/// 找不到路由 展示错误界面
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('错误页面'),
      ),
    );
  }
}
