import 'package:flutter/material.dart';
import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/home_page/article_card.dart';

/// 首页

class HomePageIndex extends StatefulWidget {
  const HomePageIndex({Key? key}) : super(key: key);

  @override
  _HomePageIndexState createState() => _HomePageIndexState();
}

/// 具体的state类
class _HomePageIndexState extends State<HomePageIndex> {
  /// 首页推荐帖子列表
  late List<StructContentDetail> contentList;

  @override
  void initState() {
    super.initState();
    // 拉取推荐内容
    setState(() {
      contentList = APIContentIndex().getRecommendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int position) {
          return ArticleCard(articleInfo: this.contentList[position]);
        },
        separatorBuilder: (context, index) {
          return Divider(height: .5, color: Color(0xFFDDDDDD));
        },
        itemCount: contentList.length);
  }
}
