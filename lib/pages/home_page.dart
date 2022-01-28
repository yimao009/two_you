import 'package:flutter/material.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/util/struct/user_info_struct.dart';
import 'package:two_you_friend/widgets/common/banner_info.dart';
import 'package:two_you_friend/widgets/home_page/article_card.dart';

/// APP 首页入口
///
/// 本模块函数，加载状态类组件HomePageState
class HomePage extends StatelessWidget {
  /// banner 地址信息
  final String bannerImage =
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg';

  /// 帖子标题
  final StructUserInfo userInfo = StructUserInfo(
    '1001',
    'test 001',
    'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg',
  );

  /// 帖子概要描述信息

  final StructContentDetail contentDetail = StructContentDetail(
    '1001',
    '长相思·一重山',
    '一重山，两重山。山远天高烟水寒，相思枫叶丹\n'
        '菊花开，菊花残。塞雁高飞人未还，一帘风月闲',
    '一重又一重，重重叠叠的山啊。山是那么远，天是那么高，烟云水气又冷又寒，可我的思念像火焰般的枫叶那样。\n'
        '菊花开了又落了，日子一天天过去。塞北的大雁在高空振翅南飞，思念的人却还没有回来。悠悠明月照在帘子上，随风飘飘然。',
    '1001',
    2,
    3,
    'http://1861.img.pp.sohu.com.cn/images/2011/9/23/15/13/u132152629_133523d58dcg215_b.jpg',
    userInfo: StructUserInfo('1001', '且听风铃',
        'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg'),
  );

  @override
  Widget build(BuildContext context) {
    print('HomePage build');
    return Container(
        child: Column(
      children: [
        BannerInfo(bannerImage: bannerImage),
        ArticleCard(articleInfo: contentDetail),
      ],
    ));
  }
}
