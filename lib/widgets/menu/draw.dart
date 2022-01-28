import 'package:flutter/material.dart';
import 'package:two_you_friend/project_router.dart';

/// 左侧菜单
class MenuDraw extends StatelessWidget {
  /// 外部跳转
  final Function redirect;

  /// 构造函数
  const MenuDraw({Key? key, required this.redirect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: const Text('Draw Header'),
              ),
              ListTile(
                title: Text('推荐'),
                leading: Icon(Icons.view_list),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://homepage');
                },
              ),
              ListTile(
                title: Text('关注'),
                leading: Icon(Icons.favorite),
                onTap: () {
                  Navigator.pop(context);
                  ProjectRouter().open(context, 'https://www.qq.com');
                },
              ),
              ListTile(
                title: Text('我'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://userpage');
                },
              ),
              ListTile(
                title: Text('图片流'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://imgflow');
                },
              ),
              ListTile(
                title: Text('单图信息'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://singlepage');
                },
              ),
            ],
          )),
    );
  }
}
