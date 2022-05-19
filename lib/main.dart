import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_bmfmap_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'package:permission_handler/permission_handler.dart';
import 'flutter_map_demo.dart';

Future<void> main() async {
  runApp(new MyApp());
  /// 动态申请定位权限
  requestPermission();

  LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();
  // NOTE: 各个SDK的隐私合规接口相互独立，若您同时集成地图SDK和定位SDK，需要分别调用隐私合规接口：地图初始化前请设置！！！
  myLocPlugin.setAgreePrivacy(true);
  /// 设置用户是否同意SDK隐私协议
  /// since 3.1.0 开发者必须设置
  BMFMapSDK.setAgreePrivacy(true);
  // NOTE: 各个SDK的隐私合规接口相互独立，若您同时集成地图SDK和定位SDK，需要分别调用隐私合规接口：地图初始化前请设置！！！

  // 百度地图sdk初始化鉴权
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'R0kfqkT4dRLjyMQgbKhvCz0WN8yn6nvR', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
  /// iOS端鉴权结果 （指定位SDK的！！）
  myLocPlugin.getApiKeyCallback(callback: (String result) {
  String str = result;
  print('鉴权结果：' + str);
  });
}
// 动态申请定位权限
void requestPermission() async {
  // 申请权限
  bool hasLocationPermission = await requestLocationPermission();
  if (hasLocationPermission) {
    // 权限申请通过
  } else {}
}
/// 申请定位权限
/// 授予定位权限返回true， 否则返回false
Future<bool> requestLocationPermission() async {
  //获取当前的权限
  var status = await Permission.location.status;
  if (status == PermissionStatus.granted) {
    //已经授权
    return true;
  } else {
    //未授权则发起一次申请
    status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: BMFAppBar(
            title: '百度地图flutter插件Demo',
            isBack: false,
          ),
          body: FlutterBMFMapDemo()
      )
    );
  }
}

// class SampleApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sample App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SampleAppPage(),
//     );
//   }
// }
//
// class SampleAppPage extends StatefulWidget {
//   SampleAppPage({Key? key}) : super(key: key);
//
//   @override
//   _SampleAppPageState createState() => _SampleAppPageState();
// }
//
// class _SampleAppPageState extends State<SampleAppPage> {
//   // Default placeholder text.
//   String textToShow = 'I Like Flutter';
//
//   void _updateText() {
//     setState(() {
//       // Update the text.
//       textToShow = 'Flutter is Awesome!';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sample App'),
//       ),
//       body: Center(child: Text(textToShow)),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _updateText,
//         tooltip: 'Update Text',
//         child: Icon(Icons.update),
//       ),
//     );
//   }
// }