import 'package:flutter/material.dart';
import 'package:two_you_friend/styles/text_styles.dart';

/// 帖子文章的点赞组件
///
/// 包括点赞组件icon，以及点赞组件点击效果
/// 需要外部参数[likeNum],点赞数量

class ArticleLikeBar extends StatefulWidget {
  final int likeNum;
  const ArticleLikeBar({Key? key, required this.likeNum}) : super(key: key);

  @override
  _ArticleLikeBarState createState() => _ArticleLikeBarState();
}

/// 帖子文章的点赞组件状态管理类
///
/// 内部包括组件的点赞效果，点击后触发数字更新操作
/// [likeNum] 为状态组件可变数据
class _ArticleLikeBarState extends State<ArticleLikeBar> {
  late int _likeNum;

  @override
  void initState() {
    super.initState();
    _likeNum = widget.likeNum;
  }

  void like() {
    setState(() {
      ++_likeNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ArticleLikeBar build');
    return GestureDetector(
      onTap: () => like(),
      child: Row(
        children: [
          Icon(Icons.thumb_up, color: Colors.grey, size: 18),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            '$_likeNum',
            style: TextStyles.commonStyle(),
          )
        ],
      ),
    );
  }
}
