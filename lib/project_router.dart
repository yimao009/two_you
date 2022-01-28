import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/article_detail/index.dart';
import 'package:two_you_friend/pages/common/web_view_page.dart';
import 'package:two_you_friend/pages/home_page/img_flow.dart';
import 'package:two_you_friend/pages/home_page/index.dart';
import 'package:two_you_friend/pages/home_page/single.dart';
import 'package:two_you_friend/pages/user_page/index.dart';
import 'package:two_you_friend/util/struct/router_struct.dart';

/// app 协议头
const String appScheme = 'tyfapp';

/// 路由配置信息
/// widget 为组件
/// entranceIndex 为首页位置，如果非首页则为-1
/// params 为组件需要的参数数组
const Map<String, RouterStruct?> routerMapping = {
  'homepage': RouterStruct(const HomePageIndex(), 0, null),
  'userpage': RouterStruct(const UserPageIndex(), 2, ['userId']),
  'contentpage': RouterStruct(const ArticleDetailIndex(), -1, ['articleId']),
  'default': RouterStruct(const HomePageIndex(), 0, null),
  'imgflow': RouterStruct(HomePageImgFlow(), -1, null),
  'singlepage': RouterStruct(HomePageSingle(), -1, null)
};

typedef mapValue = Widget Function(BuildContext);

class ProjectRouter {
  /// 解析跳转url，并且分析其内部参数
  Map<String, dynamic> _parseUrl(String url) {
    if (url == '') {
      return {'action': '/', 'param': null};
    }
    // Uri.parse(url);
    if (url.startsWith(appScheme)) {
      url = url.substring(9);
    }

    int placeIndex = url.indexOf('?');

    if (placeIndex < 0) {
      return {'action': url, 'param': null};
    }

    String action = url.substring(0, placeIndex);
    String paramStr = url.substring(placeIndex + 1);

    Map params = {};

    List<String> paramsStrArr = paramStr.split('&');
    for (String singleParamsStr in paramsStrArr) {
      List<String> singleParamsArr = singleParamsStr.split('=');
      params[singleParamsArr[0]] = singleParamsArr[1];
      // if (paramsMapping[action]?.indexOf(singleParamsArr[0]) > -1) {
      //
      // }
    }
    return {'action': action, 'params': params};
  }

  /// 执行页面跳转
  ///
  /// 需要特别注意以下逻辑
  /// -1 不在首页，则执行跳转
  /// 大于 -1 则为首页，需要在首页进行 tab 切换，而不是进行跳转
  int open(BuildContext context, String url) {
    // 非entrance入口标识
    int notEntrancePageIndex = -1;
    if (url.startsWith('https://') || url.startsWith('http://')) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CommonWebViewPage(url: url);
      }));
      return notEntrancePageIndex;
    }
    Map<String, dynamic> urlParseRet = _parseUrl(url);
    int entranceIndex =
        routerMapping[urlParseRet['action']]?.entranceIndex ?? -1;
    if (entranceIndex > notEntrancePageIndex) {
      // 判断为首页，返回切换的tab信息
      return entranceIndex;
    }
    Navigator.pushNamedAndRemoveUntil(context, urlParseRet['action'].toString(),
        (route) {
      if (route.settings.name == urlParseRet['action'].toString()) {
        return false;
      }
      return true;
    }, arguments: urlParseRet['params']);
    // 执行跳转，非首页
    return notEntrancePageIndex;
  }

  /// 执行页面跳转
  void push(BuildContext context, String url) {
    Map<String, dynamic> urlParseRet = _parseUrl(url);

    // 不同页面，则跳转
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return _getPage(url, urlParseRet);
    // }));

    // 进阶版
    Navigator.pushNamedAndRemoveUntil(context, urlParseRet['action'].toString(),
        (route) {
      if (route.settings.name == urlParseRet['action'].toString()) {
        return false;
      }
      return true;
    }, arguments: urlParseRet['params']);
  }

  /// 增加 scaffold
  Widget _buildPage(Widget widgetPage) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two You'),
      ),
      body: Center(
        child: widgetPage,
      ),
    );
  }

  /// 注册路由事件
  Map<String, Widget Function(BuildContext)> registerRouter() {
    Map<String, mapValue> routerInfo = {};
    routerMapping.forEach((routerName, routerData) {
      if (routerName == 'default') {
        // 默认逻辑不处理
        return;
      }
      routerInfo[routerName] = (context) => _buildPage(routerData!.widget);
    });
    return routerInfo;
  }

  /// 根据页面路由，获取页面信息
  Widget getPageByRouter(String pageName) {
    Widget pageWidget;
    if (routerMapping[pageName] != null) {
      pageWidget = routerMapping[pageName]!.widget;
    } else {
      pageWidget = routerMapping['default']!.widget;
    }
    return pageWidget;
  }
}
