import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/page/notice/notice_list_page.dart';

class NoticeCenterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoticeCenterPage();
}

class _NoticeCenterPage extends State<NoticeCenterPage> {

  List<dynamic> _menus=["密码通知","系统通知","整改提醒","超期提醒","其他消息"];
/*
  List<Icon> _menuIcons=[new Icon(Icons.settings, color: Colors.white),
    new Icon(Icons.alarm, color: Colors.white),
    new Icon(Icons.flash_on, color: Colors.white),
    new Icon(Icons.error, color: Colors.white),
    new Icon(Icons.info, color: Colors.white),
  ];
*/

  Widget _getMenuItem(dynamic i) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          border:BorderDirectional(
              bottom: BorderSide(color:  Colors.black12, width: 1.0)
          )
      ),
      //color: Colors.white,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (ctx)=>NoticeListPage(_menus[i])));
        },
        child: Container(
          padding: EdgeInsets.only(top: 4,bottom: 4),
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: new CircleAvatar(
                    radius: 20.0,
                    child: new Icon(Icons.settings, color: Colors.white),
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_menus[i]),
                ),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.grey),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _getBody() => new SingleChildScrollView(
        child: Container(

          margin: const EdgeInsets.only(top: 5.0),
          child: Column(
            children: <Widget>[
              _getMenuItem(0),
              _getMenuItem(1),
              _getMenuItem(2),
              _getMenuItem(3),
              _getMenuItem(4),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: GlobalConfig.themeData,
        title: "小寓优品",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "消息中心",
              style:
                  TextStyle(fontSize: 16, color: GlobalConfig.navBarItemColor),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: GlobalConfig.jiangRoomYellow,
                textDirection: TextDirection.ltr,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 0.1,
          ),
          body: _getBody(),
        ));
  }
}
