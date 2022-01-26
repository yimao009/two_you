import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_you_friend/project_router.dart';

/// eum 类型
enum UniLinksType {
  /// string link
  string,
}

/// 项目页面入口文件
class Entrance extends StatefulWidget {
  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  UniLinksType _type = UniLinksType.string;
  late StreamSubscription _sub;
  ProjectRouter router = ProjectRouter();

  @override
  void initState() {
    super.initState();
    //  scheme初始化，保证有上下文，需要跳转页面
    // initPlatformState();
  }

  ///  初始化Scheme只使用了String类型的路由跳转
  ///  所以只有一个有需求可以使用[initPlatformStateForUriUniLinks]
  // Future<void> initPlatformState() async {
  //   if (_type == UniLinksType.string) {
  //     await initPlatformStateForStringUniLinks();
  //   }
  // }

  /// 使用[String]链接实现
  // Future<void> initPlatformStateForStringUniLinks() async {
  //   String? initialLink;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     initialLink = await getInitialLink();
  //     router.push(context, initialLink ?? '');
  //   } on PlatformException {
  //     initialLink = 'Failed to get initial link.';
  //   } on FormatException {
  //     initialLink = 'Failed to parse the initial link as Uri.';
  //   }
  //   // Attach a listener to the links stream
  //   _sub = linkStream.listen((event) {
  //     if (!mounted) return;
  //     router.push(context, event ?? '');
  //   }, onError: (error) {
  //     if (!mounted) return;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text('Hello Flutter scaffold'),
          ),
        ],
      ),
    );
  }
}
