import 'package:flutter_test/flutter_test.dart';
import 'package:two_you_friend/util/struct/comment_info.dart';
import 'package:two_you_friend/util/struct/user_info_struct.dart';

/// struct 单元测试
void main() {
  final StructUserInfo userInfo = StructUserInfo('test', 'http://test.com', '');
  test('test-userinfo', () {
    final CommentInfoStruct commentInfoStruct =
        CommentInfoStruct(userInfo, 'comment test');
    expect(commentInfoStruct.comment == 'comment test', true);
    expect(commentInfoStruct.userInfo.nickName == 'test', true);
    expect(commentInfoStruct.userInfo.headerUrl, 'http://test.com');
  });
}
