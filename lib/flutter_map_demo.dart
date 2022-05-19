import 'package:flutter/material.dart';
import 'package:flutter_bmfmap_example/DemoPages/Draw/map_draw_page.dart';
import 'package:flutter_bmfmap_example/DemoPages/Interact/show_interact_page.dart';
import 'package:flutter_bmfmap_example/DemoPages/LayerShow/show_layer_map_page.dart';
import 'package:flutter_bmfmap_example/DemoPages/Map/show_create_map_page.dart';
import 'package:flutter_bmfmap_example/CustomWidgets/function_item.widget.dart';
import 'package:flutter_bmfmap_example/DemoPages/Utils/flutter_maputils_demo.dart';
import 'DemoPages/SearchRoute/show_search_route_page.dart';
import 'DemoPages/search/common/show_search_page.dart';
import 'location/circleGeofencePage.dart';
import 'location/headingLocationPage.dart';
import 'location/polygonGeofencePage.dart';
import 'location/seriesLocationPage.dart';
import 'location/singleLocationPage.dart';
import 'my_test_widget.dart';

class FlutterBMFMapDemo extends StatelessWidget {
  const FlutterBMFMapDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        FunctionItem(
          label: '创建地图',
          sublabel: '基础地图、个性化地图、TextureMapView、离线地图、室内地图以及多地图创建',
          target: ShowCreateMapPage(),
        ),
        FunctionItem(
          label: '图层展示',
          sublabel: '卫星图、交通流量图、百度城市热力图、3D地图及定位图层的展示',
          target: ShowLayerMapPage(),
        ),
        FunctionItem(
          label: '在地图上绘制',
          sublabel: '介绍自定义绘制点、线、多边形、圆等几何图形和文字',
          target: MapDrawPage(),
        ),
        FunctionItem(
          label: '与地图交互',
          sublabel: '介绍地图基本控制方法，事件响应、手势控制以及UI控件的显示与隐藏',
          target: ShowInteractPage(),
        ),
        FunctionItem(
          label: '检索地图数据',
          sublabel: '检索和展示地图上的数据',
          target: ShowSearchPage(),
        ),
        FunctionItem(
          label: '路线规划',
          sublabel: '各种场景下的路线规划',
          target: ShowSearchRoutePage(),
        ),
        FunctionItem(
          label: '实用工具',
          sublabel: '调起百度地图等功能',
          target: FlutterBMFUtilsDemo(),
        ),
        FunctionItem(
          label: 'testMyMap',
          sublabel: '调起百度地图',
          target: TestBaiduMapPage(),
        ),
        FunctionItem(
          label: '单次定位',
          sublabel: 'singleLocationPage',
          target: SingleLocationPage(),
        ),

        ///需要停止定位
        FunctionItem(
          label: '连续定位',
          sublabel: 'seriesLocationPage',
          target: SeriesLocationPage(),
        ),
        FunctionItem(
          label: '圆形地理围栏',
          sublabel: 'circleGeofencePage',
          target: CircleGeofencePage(),
        ),
        FunctionItem(
          label: '多边形地理围栏',
          sublabel: 'polygonGeofencePage',
          target: PolygonGeofencePage(),
        ),
        FunctionItem(
          label: '监听设备朝向',
          sublabel: 'headingLocationPage',
          target: HeadingLocationPage(),
        ),
      ]),
    );
  }
}
