import 'package:flutter/material.dart';
import 'package:two_you_friend/styles/text_styles.dart';

/// 帖子下面的信息栏
///
/// 包括用户头像、昵称和评论信息，但不包括点赞，因为点赞为动态组件
/// 需要参数[nickname]、[headerImage]、[commentNum]
class ArticleBottomBar extends StatelessWidget {
  /// 作者头像
  final String headerImage;

  /// 作者昵称
  final String nickName;

  /// 帖子评论数量
  final int commentNum;

  /// 构造函数
  const ArticleBottomBar(
      {Key? key,
      required this.headerImage,
      required this.nickName,
      required this.commentNum})
      : super(key: key);

  /// 帖子栏中的用户头像和昵称信息
  Widget getUserWidget() {
    return Row(
      children: [
        Image.network(
          headerImage,
          width: 15,
          height: 15,
          fit: BoxFit.cover,
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          nickName,
          style: TextStyles.commonStyle(),
        )
      ],
    );
  }

  /// 帖子栏中的评论信息
  Widget getCommentWidget() {
    return Row(
      children: [
        Icon(Icons.comment, color: Colors.grey, size: 18),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text('$commentNum', style: TextStyles.commonStyle())
      ],
    );
  }

  /// 无状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('ArticleBottomBar build');
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: getUserWidget(),
          ),
          Expanded(
            flex: 3,
            child: getCommentWidget(),
          ),
        ],
      ),
    );
  }
}
