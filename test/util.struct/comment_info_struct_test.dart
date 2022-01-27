import 'package:flutter_test/flutter_test.dart';
import 'package:two_you_friend/util/struct/CommentInfoStruct.dart';
import 'package:two_you_friend/util/struct/user_info_struct.dart';

/// struct 单元测试
void main() {
  final UserInfoStruct userInfo = UserInfoStruct('test', 'http://test.com');
  test('test-userinfo', () {
    final CommentInfoStruct commentInfoStruct =
        CommentInfoStruct(userInfo, 'comment test');
    expect(commentInfoStruct.comment == 'comment test', true);
    expect(commentInfoStruct.userInfo.nickname == 'test', true);
    expect(commentInfoStruct.userInfo.headerImage, 'http://test.com');
  });
}
