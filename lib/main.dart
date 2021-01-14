import 'package:flutter/material.dart';
import 'package:flutter_user_agent/flutter_user_agent.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:web_bridge_demo/screen_bridge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterUserAgent.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: WebviewScaffold(
        // url: 'http://10.205.29.103:8088/',
        url: 'http://127.0.0.1:8088/',
        clearCache: false,
        clearCookies: false,
        withZoom: false,
        withLocalStorage: true,
        scrollBar: false,
        hidden: true,
        resizeToAvoidBottomInset: true,
        // initialChild: widget.initialChild,
        userAgent: ScreenBridge.getSafeAreaInfo(),
        // 固定设置为true
        withJavascript: true,
        // 固定设置为约定开发的全量功能，可根据传入参数进行权限限制，不能使用某些桥接接口
        javascriptChannels: <JavascriptChannel>[].toSet(),
      ),
    );
  }
}
