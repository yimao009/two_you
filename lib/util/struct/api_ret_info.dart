import 'package:two_you_friend/util/struct/content_detail.dart';

class StructApiContentListRetInfo {
  final int ret;
  final String message;
  final bool hasMore;
  final String? lastId;
  final List<StructContentDetail> data;

  const StructApiContentListRetInfo(
      {required this.ret,
      required this.message,
      required this.hasMore,
      required this.lastId,
      required this.data});
}
