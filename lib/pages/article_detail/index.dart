import 'package:flutter/material.dart';
import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/util/tools/json_config.dart';
import 'package:two_you_friend/widgets/article_detail/article_comments.dart';
import 'package:two_you_friend/widgets/article_detail/article_content.dart';
import 'package:two_you_friend/widgets/article_detail/article_detail_like.dart';

/// 首页
class ArticleDetailIndex extends StatelessWidget {
  /// 帖子id
  final String? articleId;

  /// 构造函数
  const ArticleDetailIndex({Key? key, this.articleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? id = articleId;
    if (articleId == null &&
        ModalRoute.of(context)?.settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context)!.settings.arguments);
      id = dataInfo['articleId'].toString();
    }

    if (id == null) {
      return const Text('ArticleDetailIndex error');
    }
    StructContentDetail articleInfo = APIContentIndex().getOneById(id);
    return Column(
      children: [
        ArticleContent(content: articleInfo.detailInfo),
        ArticleDetailLike(articleId: id, likeNum: articleInfo.likeNum),
        ArticleComments(commentList: []),
      ],
    );
  }
}
