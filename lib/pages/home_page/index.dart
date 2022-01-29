import 'package:flutter/material.dart';
import 'package:two_you_friend/api/content/index.dart';
import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/widgets/common/error.dart';
import 'package:two_you_friend/widgets/common/loading.dart';
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

  ///
  ScrollController _scrollController = ScrollController();

  /// 是否有下一页
  late bool hasMore;

  /// 是否在下拉刷新中
  late bool isLoading;

  /// 最后一个数据id
  String? lastId;

  /// 接口是否有错
  bool error = false;

  @override
  void initState() {
    super.initState();

    /// 拉取首页接口数据
    setFirstPage();

    _scrollController.addListener(() {
      if (!hasMore) {
        return;
      }
      if (!isLoading &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        isLoading = true;
        loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (error) {
      return CommonError(action: this.setFirstPage);
    }
    return RefreshIndicator(
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int position) {
          if (position < this.contentList.length) {
            return ArticleCard(articleInfo: this.contentList[position]);
          }
          return CommonLoadingButton(loadingState: isLoading, hasMore: hasMore);
        },
        separatorBuilder: (context, index) {
          return Divider(height: .5, color: Color(0xFFDDDDDD));
        },
        itemCount: contentList.length + 1,
      ),
      onRefresh: onRefresh,
    );
  }

  /// 处理首次拉取和刷新数据获取动作
  void setFirstPage() {
    print('2222');
    StructApiContentListRetInfo retInfo = APIContentIndex().getRecommendList();

    setState(() {
      if (retInfo.ret != 0) {
        // 判断返回是否正确
        error = true;
        return;
      }
      error = false;
      contentList = retInfo.data;
      hasMore = retInfo.hasMore;
      isLoading = false;
      lastId = retInfo.lastId;
    });
  }

  /// 加载下一页
  void loadMoreData() {
    StructApiContentListRetInfo retInfo =
        APIContentIndex().getRecommendList(lastId);
    if (retInfo.ret != 0) {
      setState(() {
        error = true;
      });
      return;
    }
    List<StructContentDetail> newList = retInfo.data;
    setState(() {
      error = false;
      isLoading = false;
      hasMore = retInfo.hasMore;
      contentList.addAll(newList);
    });
  }

  /// 处理刷新操作
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      setFirstPage();
    });
  }
}
