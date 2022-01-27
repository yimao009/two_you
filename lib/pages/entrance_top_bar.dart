import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/search_page/custom_delegate.dart';
import 'package:two_you_friend/widgets/menu/draw.dart';

import '../project_router.dart';

/// eum 类型
enum UniLinksType {
  /// string link
  string,
}

class Entrance extends StatefulWidget {
  /// 页面索引位置
  final int? indexValue;

  const Entrance({Key? key, this.indexValue}) : super(key: key);

  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  ProjectRouter router = ProjectRouter();

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
    super.dispose();

    _controller.dispose();
  }

  /// 跳转页面
  void redirect(String link) {
    int indexNum = router.open(context, link);
    if (indexNum > -1 && _controller.index != indexNum) {
      _controller.animateTo(indexNum);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('two you'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchPageCustomDelegate());
              },
              icon: Icon(Icons.search)),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.view_list), text: '推荐'),
            Tab(icon: Icon(Icons.favorite), text: '关注'),
            Tab(icon: Icon(Icons.person), text: '我'),
          ],
        ),
      ),
      drawer: MenuDraw(redirect: redirect),
      body: TabBarView(
        controller: _controller,
        children: [
          router.getPageByRouter('homepage'),
          Icon(Icons.directions_transit),
          router.getPageByRouter('userpage')
        ],
      ),
    );
  }
}
