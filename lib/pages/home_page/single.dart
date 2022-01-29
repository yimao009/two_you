import 'package:flutter/material.dart';
import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/home_page/single_bottom_summary.dart';
import 'package:two_you_friend/widgets/home_page/single_like_bar.dart';
import 'package:two_you_friend/widgets/home_page/single_right_bar.dart';

/// 单个内容首页
class HomePageSingle extends StatefulWidget {
  const HomePageSingle({Key? key}) : super(key: key);

  @override
  _HomePageSingleState createState() => _HomePageSingleState();
}

/// 具体的state类
class _HomePageSingleState extends State<HomePageSingle> {
  /// index position
  int indexPos = 0;

  /// 首页推荐帖子列表
  late List<StructContentDetail> contentList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentList = APIContentIndex().getRecommendList().data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(contentList[indexPos].articleImage),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SingleRightBar(
              nickname: contentList[indexPos].userInfo?.nickName ?? 'no data',
              headerImage:
                  contentList[indexPos].userInfo?.headerUrl ?? 'no data',
              commentNum: contentList[indexPos].commentNum),
          SingleLikeBar(
              articleId: contentList[indexPos].id,
              likeNum: contentList[indexPos].likeNum),
          SingleBottomSummary(
            articleId: contentList[indexPos].id,
            title: contentList[indexPos].title,
            summary: contentList[indexPos].summary,
          ),
        ],
      ),
    );
  }
}
