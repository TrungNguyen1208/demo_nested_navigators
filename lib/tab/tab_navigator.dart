import 'package:demo_push_keep_bottom_nav/color_detail_page.dart';
import 'package:demo_push_keep_bottom_nav/colors_list_page.dart';
import 'package:flutter/material.dart';

import 'tab_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  TabNavigator({this.navigatorKey, this.tabItem});

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => ColorsListPage(
        color: activeTabColor[tabItem],
        title: tabName[tabItem],
        onPush: (materialIndex) =>
            _push(context, materialIndex: materialIndex),
      ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
        color: activeTabColor[tabItem],
        title: tabName[tabItem],
        materialIndex: materialIndex,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }
}
