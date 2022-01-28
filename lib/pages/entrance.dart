import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/search_page/custom_delegate.dart';
import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/widgets/menu/draw.dart';

/// eum 类型
enum UniLinksType {
  /// string link
  string,
}

/// 项目页面入口文件
class Entrance extends StatefulWidget {
  /// 页面索引位置
  final int? indexValue;

  /// 构造函数
  const Entrance({Key? key, this.indexValue}) : super(key: key);

  @override
  _EntranceState createState() => _EntranceState();
}

/// entrance 状态类
///
/// 入口文件
class _EntranceState extends State<Entrance>
    with SingleTickerProviderStateMixin {
  /// 页面索引位置
  int _currentIndex = 0;
  ProjectRouter router = ProjectRouter();
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);

    if (widget.indexValue != null) {
      _controller.animateTo(widget.indexValue!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  /// 跳转页面
  void redirect(String link) {
    int indexNum = router.open(context, link);
    if (indexNum > -1 && _controller.length != indexNum) {
      setState(() {
        _currentIndex = indexNum;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  应用栏，显示在顶部，包括其中的搜索框
      appBar: AppBar(
        title: Text('Two You'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchPageCustomDelegate());
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Stack(
        children: [
          _getPageWidget(0),
          _getPageWidget(1),
          _getPageWidget(2),
        ],
      ),
      drawer: MenuDraw(redirect: redirect),
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '推荐',
              activeIcon: Icon(Icons.people_outline)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '关注',
              activeIcon: Icon(Icons.favorite_outline)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我',
              activeIcon: Icon(Icons.person_outline)),
        ],
        iconSize: 24,
        currentIndex: _currentIndex,
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          /// 这里根据点击的index来显示，非index的page均隐藏
          if (_currentIndex != index) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }

  /// 获取页面组件
  Widget _getPageWidget(int index) {
    List<Widget> widgetList = [
      router.getPageByRouter('homepage'),
      Icon(Icons.directions_train),
      router.getPageByRouter('userpage'),
    ];

    return Offstage(
      offstage: _currentIndex != index,
      child: TickerMode(
        enabled: _currentIndex == index,
        child: widgetList[index],
      ),
    );
  }
}
