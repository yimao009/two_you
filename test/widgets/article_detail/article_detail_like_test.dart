import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/widgets/article_detail/article_detail_like.dart';

/// 有状态组件测试
void main() {
  final LikeNumModel likeNumModel = LikeNumModel();

  testWidgets('test article like widget', (WidgetTester tester) async {
    final Widget testWidgets = ArticleDetailLike();
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: likeNumModel,
        child: MaterialApp(
          home: testWidgets,
        ),
      ),
    );
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    /// 测试模拟点击 重新rebuild
    await tester.tap(find.byType(FlatButton));
    await Future.microtask(tester.pump);
    expect(find.text('1'), findsOneWidget);
  });
}
