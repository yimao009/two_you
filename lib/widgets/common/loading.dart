import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自行展示，load more还是已加载完成
class CommonLoadingButton extends StatelessWidget {
  final bool loadingState;

  final bool hasMore;

  const CommonLoadingButton(
      {Key? key, required this.loadingState, required this.hasMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!this.hasMore) {
      return NoMore();
    }
    if (this.loadingState) {
      return Loading();
    } else {
      return LoadingStatic();
    }
  }
}

/// 加载中组件
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '努力加载中',
            style: TextStyle(fontSize: 15, color: Color(0xFF333333)),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          )
        ],
      ),
    );
  }
}

/// 上拉加载状态
class LoadingStatic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: Text(
        '上拉加载更多',
        style: TextStyle(
          fontSize: 15,
          color: Color(0xFF333333),
        ),
      ),
    );
  }
}

/// 无更多加载展示
class NoMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: Text(
        '已经到底裤了',
        style: TextStyle(
          fontSize: 15,
          color: Color(0xFF333333),
        ),
      ),
    );
  }
}

/// 初始化
class InitLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
