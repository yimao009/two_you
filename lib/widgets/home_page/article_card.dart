import 'package:flutter/material.dart';
import 'package:two_you_friend/util.struct/article_summary_struct.dart';
import 'package:two_you_friend/util.struct/user_info_struct.dart';
import 'package:two_you_friend/widgets/home_page/article_bottom_bar.dart';
import 'package:two_you_friend/widgets/home_page/article_like_bar.dart';
import 'package:two_you_friend/widgets/home_page/article_summary.dart';

/// 此为帖子描述类，包括了帖子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入的用户信息
  final UserInfoStruct infoStruct;

  final ArticleSummaryStruct articleSummaryStruct;

  const ArticleCard({
    Key? key,
    required this.infoStruct,
    required this.articleSummaryStruct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ArticleCard build');
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white70,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            ArticleSummary(
                title: articleSummaryStruct.title,
                summary: articleSummaryStruct.summary,
                articleImage: articleSummaryStruct.articleImage),
            Row(
              children: [
                Expanded(
                    flex: 9,
                    child: ArticleBottomBar(
                      nickName: infoStruct.nickname,
                      headerImage: infoStruct.headerImage,
                      commentNum: articleSummaryStruct.commentNum,
                    )),
                Expanded(
                    flex: 2,
                    child: ArticleLikeBar(
                      likeNum: articleSummaryStruct.likeNum,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
