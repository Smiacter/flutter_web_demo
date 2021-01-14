import 'package:flustars/flustars.dart';
import 'package:flutter_user_agent/flutter_user_agent.dart';

class ScreenBridge {
  /// 获取手机安全区域信息 - 顶部状态栏、底部安全区高度
  /// 参数：无
  /// 返回：
  ///   类接口格式的JSON字符串，具体见README或接口文档
  static String getSafeAreaInfo() {
    var statusHeight = ScreenUtil.getInstance().statusBarHeight;
    var bottomHeight = ScreenUtil.getInstance().bottomBarHeight;

    var ua = FlutterUserAgent.webViewUserAgent;

    // /hasScreen 44,0,44,0/
    return ua +
        '/hasScreen ${statusHeight.toString()},0,${bottomHeight.toString()},0/';
  }
}
