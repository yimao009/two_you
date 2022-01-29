import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/home_page/img_card.dart';

/// 九宫格首页
class HomePageImgFlow extends StatefulWidget {
  /// 构造函数
  const HomePageImgFlow({Key? key}) : super(key: key);

  @override
  _HomePageImgFlowState createState() => _HomePageImgFlowState();
}

/// 具体的state类
class _HomePageImgFlowState extends State<HomePageImgFlow> {
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
    List<StructContentDetail> tmpList = [];
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, position) {
            if (position % 3 == 0) {
              // 起始位置初始赋值
              tmpList = [contentList[position]];
            } else {
              // 非初始则插入列表
              tmpList.add(contentList[position]);
            }
            // 判断数据插入时机，如果最后一组或者满足三个一组则插入
            if (position == contentList.length - 1 || (position + 1) % 3 == 0) {
              return ImgCard(
                  position: position,
                  articleInfoList: tmpList,
                  isLast: position == contentList.length - 1);
            }
            return Container();
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: .1,
              //indent: 75,
              color: Color(0xFFDDDDDD),
            );
          },
          itemCount: contentList.length),
    );
  }
}
