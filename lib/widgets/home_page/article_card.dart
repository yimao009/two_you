import 'package:flutter/material.dart';
import 'package:two_you_friend/project_router.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/home_page/article_bottom_bar.dart';
import 'package:two_you_friend/widgets/home_page/article_like_bar.dart';
import 'package:two_you_friend/widgets/home_page/article_summary.dart';

/// 此为帖子描述类，包括了帖子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入的帖子信息
  final StructContentDetail articleInfo;

  /// 构造函数
  const ArticleCard({Key? key, required this.articleInfo}) : super(key: key);

  /// 执行页面跳转到article_detail
  void gotoArticleDetailPage(BuildContext context, String articleId) {
    ProjectRouter().open(context, 'tyfapp://contentpage?articleId=$articleId');
  }

  @override
  Widget build(BuildContext context) {
    print('ArticleCard build');
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white70,
      child: GestureDetector(
        onTap: () => gotoArticleDetailPage(context, articleInfo.id),
        child: Column(
          children: [
            ArticleSummary(
                title: articleInfo.title,
                summary: articleInfo.summary,
                articleImage: articleInfo.articleImage),
            Row(
              children: [
                Expanded(
                    flex: 9,
                    child: ArticleBottomBar(
                      nickName: articleInfo.userInfo!.nickName,
                      headerImage: articleInfo.userInfo!.headerUrl,
                      commentNum: articleInfo.commentNum,
                    )),
                Expanded(
                    flex: 2,
                    child: ArticleLikeBar(
                      articleId: articleInfo.id,
                      likeNum: articleInfo.likeNum,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
