import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/generated/i18n.dart';
import 'package:xyyp/ui/page/business/business_page.dart';
import 'package:xyyp/ui/page/mine/mine_page.dart';
import 'package:xyyp/ui/page/workbench/workbench_page.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _tabIdx = 0;
  var _appBarTitles = ["业务", "工作台", "我的"];
  List<BottomNavigationBarItem> _navigationBarItems;

  var _body;

  void initData() {
    _body = IndexedStack(
      index: _tabIdx,
      children: <Widget>[BusinessPage(), WorkbenchPage(), MinePage()],
    );
  }

  @override
  void initState() {
    super.initState();
    _navigationBarItems = [
      BottomNavigationBarItem(
          title: Text(_appBarTitles[0]), icon: Icon(Icons.assignment)),
      BottomNavigationBarItem(
          title: Text(_appBarTitles[1]), icon: Icon(Icons.home)),
      BottomNavigationBarItem(
          title: Text(_appBarTitles[2]), icon: Icon(Icons.person))
    ];
  }

  final _globalKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
        navigatorKey: _globalKey,
        theme: GlobalConfig.themeData,
        debugShowCheckedModeBanner: false,
        title: "小寓优品",
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: Scaffold(
          /* appBar: AppBar(title: Text("业务中心"),
        //actions: <Widget>[IconButton(icon:Icon( Icons.menu),)],
        ),*/
          body: _body,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabIdx,
            items: _navigationBarItems,
            fixedColor: GlobalConfig.navBarItemColor,
            type: BottomNavigationBarType.fixed,
            onTap: (idx) {
              setState(() {
                _tabIdx = idx;
              });
            },
          ),
        ));
  }
}
