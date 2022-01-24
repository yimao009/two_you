import 'package:flutter/material.dart';
import 'package:two_you_friend/styles/text_styles.dart';

/// 帖子标题描述组件
///
/// 包括帖子的标题，帖子描述和帖子中的图片
/// 需要外部参数[title]，点赞数量
/// 需要外部参数[summary]，点赞数量
/// 需要外部参数[articleImage]，点赞数量
class ArticleSummary extends StatelessWidget {
  /// 帖子标题
  final String title;

  /// 帖子概要描述信息
  final String summary;

  /// 帖子中的图片信息
  final String articleImage;

  const ArticleSummary(
      {Key? key,
      required this.title,
      required this.summary,
      required this.articleImage})
      : super(key: key);

  Widget getLeftInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.commonStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Text(
          summary,
          style: TextStyles.commonStyle(0.8),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('ArticleSummary build');
    return Row(
      children: [
        Expanded(
          child: getLeftInfo(),
          flex: 6,
        ),
        Expanded(
          child: Image.network(
            articleImage,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
