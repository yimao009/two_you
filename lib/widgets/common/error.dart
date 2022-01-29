import 'package:flutter/material.dart';
import 'package:two_you_friend/util/tools/json_config.dart';

class CommonError extends StatelessWidget {
  /// 具体错误码
  final String? errorCode;

  /// 可点击的回调函数
  final Function? action;

  /// 返回提示信息

  const CommonError({
    Key? key,
    this.errorCode,
    this.action,
  }) : super(key: key);

  static const errorMapping = {
    'server_error': '服务器响应错误',
    'error': '系统异常',
    'default': '服务异常'
  };

  @override
  Widget build(BuildContext context) {
    String? newErrorCode = errorCode;
    Function? newAction = action;

    if (ModalRoute.of(context)?.settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context)!.settings.arguments);
      if (dataInfo['errorCode'] != null) {
        newErrorCode = dataInfo['errorCode'] as String;
      }
      if (dataInfo['action'] != null) {
        newAction = dataInfo['action'] as Function;
      }
    }
    // 判断是否存在，不存在使用默认提示
    if (errorMapping[newErrorCode] == null) {
      newErrorCode = 'default';
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('${errorMapping[newErrorCode]}'),
            ElevatedButton(
              onPressed: () {
                if (newAction != null) {
                  newAction();
                }
              },
              child: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
