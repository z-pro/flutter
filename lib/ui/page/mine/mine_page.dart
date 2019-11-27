import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'package:xyyp/consts/base_const.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/event/login_event.dart';
import 'package:xyyp/ui/page/common/webview_page.dart';
import 'package:xyyp/ui/page/mine/user_login_page.dart';
import 'package:xyyp/ui/page/notice/notice_center_page.dart';
import 'package:xyyp/utils/user_account_util.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePage();
}

class _MinePage extends State<MinePage> {
  Widget _getHeader() {
    return Container(
      color: Colors.white,
      padding:
          const EdgeInsets.only(top: 32.0, bottom: 2.0, left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Text("我的",
              style: TextStyle(
                  fontSize: 16,
                  color: GlobalConfig.navBarItemColor,
                  fontWeight: FontWeight.bold)),
          new Expanded(
              child: new Container(
            child: new Text(""),
          )),
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new NoticeCenterPage()));
            },
          )
        ],
      ),
    );
  }

  Widget _getUserInfo() {
    return Container(
      color: Colors.white,
      child: Container(
        constraints: BoxConstraints.expand(height: 160),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("assets/images/ic_mine_bg.png"),
            //fit: BoxFit.fitWidth,
            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 100,
                      child: Text(
                        userName,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 100,
                      child: Text(
                        "配置操作专员",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Expanded(
                child: new Container(
              child: new Text(""),
            )),
            Container(
              margin: const EdgeInsets.only(right: 30),
              width: 50,
              child: AspectRatio(
                aspectRatio: 1.0 / 1.0,
                child: Container(
                  foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://pic2.zhimg.com/50/v2-55039fa535f3fe06365c0fcdaa9e3847_400x224.jpg"),
                        centerSlice:
                            const Rect.fromLTRB(150.0, 150.0, 150.0, 150.0),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMenus() {
    Widget _itemSettingPwd = ListTile(
      leading: Icon(Icons.settings),
      title: Text("修改密码"),
      trailing: Icon(Icons.chevron_right, color: Colors.grey), //
      onTap: () {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (builder) => UserLoginPage()));
      }, // Theme.of(context).accentColor
    );
    Widget _itemClearCache = ListTile(
      leading: Icon(Icons.remove_circle_outline),
      title: Text("清理缓存"),
      onTap: () {
        setState(() {
          if (GlobalConfig.dark == true) {
            GlobalConfig.themeData = new ThemeData(
              primaryColor: Colors.white,
              scaffoldBackgroundColor: new Color(0xFFEBEBEB),
            );
            /*GlobalConfig.searchBackgroundColor = new Color(0xFFEBEBEB);
            GlobalConfig.cardBackgroundColor = Colors.white;
            GlobalConfig.fontColor = Colors.black54;*/
            GlobalConfig.dark = false;
          } else {
            GlobalConfig.themeData = new ThemeData.dark();
            /*  GlobalConfig.searchBackgroundColor = Colors.white10;
            GlobalConfig.cardBackgroundColor = new Color(0xFF222222);
            GlobalConfig.fontColor = Colors.white30;*/
            GlobalConfig.dark = true;
          }
        });
      },
      trailing: Icon(Icons.chevron_right,
          color: Colors.grey), // Theme.of(context).accentColor
    );
    Widget _itemAboutus = ListTile(
      leading: Icon(Icons.info),
      title: Text("关于我们"),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (ctx) =>
                WebviewPage(title: "关于我们", url: "https://github.com/z-pro")));
      },
      trailing: Icon(Icons.chevron_right,
          color: Colors.grey), // Theme.of(context).accentColor
    );
    Widget _itemLogout = ListTile(
      leading: Icon(Icons.remove_circle),
      title: Text("退出登录"),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            tittle: '确定退出吗？亲',
            desc: '',
            btnOkText: "确定",
            btnCancelText: "取消",
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              UserAccountUtil.clearLoginInfo();
              BaseConst.eventBus.fire(LoginEvent());
              Toast.show("清除成功！", context);
            }).show();
      }, // Theme.of(context).accentColor
    );
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: 236,
        color: Colors.white,
        child: ListView(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            children: <Widget>[
              _itemSettingPwd,
              _itemClearCache,
              _itemAboutus,
              _itemLogout
            ]));
    /*ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        _itemSettingPwd,
                        _itemClearCache,
                        _itemAboutus,
                        _itemLogout
                      ],
                    ),
                    // 下边框
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xffe5e5e5)))),
                  );
                }));*/
  }

  String userName;

  _getName() {
    UserAccountUtil.getUserName().then((username) {
      setState(() {
        userName = username;
        if (username == null) {
          userName = "请登录";
        }
      });
    });
  }

  @override
  void initState() {
    _getName();
    BaseConst.eventBus.on<LoginEvent>().listen((event) {
      _getName();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _getHeader(),
          Divider(
            height: 1.0,
            indent: 1.0,
            color: GlobalConfig.grey,
          ),
          _getUserInfo(),
          _getMenus()
        ],
      ),
    );
  }
}
