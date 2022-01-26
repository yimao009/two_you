import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// 通用跳转逻辑
class CommonWebViewPage extends StatelessWidget {
  /// url 地址
  final String url;
  const CommonWebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
