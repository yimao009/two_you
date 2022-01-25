import 'package:flutter/material.dart';
import 'package:two_you_friend/styles/text_styles.dart';

/// 具体的帖子详情，内容模块
///
/// [content]为帖子详情内容
class ArticleContent extends StatelessWidget {
  /// 传入的用户信息
  final String content;

  /// 构造函数
  const ArticleContent({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Text(
        this.content,
        softWrap: true,
        style: TextStyles.commonStyle(),
      ),
    );
  }
}
