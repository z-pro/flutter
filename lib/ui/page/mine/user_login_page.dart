import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:toast/toast.dart';
import 'package:xyyp/consts/base_const.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/event/login_event.dart';
import 'package:xyyp/utils/user_account_util.dart';

class UserLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserLoginPage();
}

class _UserLoginPage extends State<UserLoginPage> {
  TextEditingController _nameCtrl = TextEditingController(text: '');
  TextEditingController _passwordCtrl = TextEditingController(text: '');

  Widget _getLoginArea() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            color: GlobalConfig.grey2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    controller: _nameCtrl,
                    decoration: InputDecoration(
                      hintText: "请输入账户名",
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            color: GlobalConfig.grey2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _passwordCtrl,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "请输入密码",
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              child: Text(
                "登录",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: GlobalConfig.jiangRoomYellow,
              disabledColor: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                String name = _nameCtrl.text;
                if (null == name||name=="") {
                  _showMessage("账户名不能为空");
                  return;
                }
                Toast.show("用户名${_nameCtrl.text}", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                UserAccountUtil.saveLoginInfo(_nameCtrl.text).then((r) {
                  BaseConst.eventBus.fire(LoginEvent());
                  Navigator.of(context).pop();
                });

                print("用户名${_nameCtrl.text}");
                print("密码${_passwordCtrl.text}");

                Map<String, String> map = Map();
                map['username'] = _nameCtrl.text;
                map['password'] = _passwordCtrl.text;

                /*   HttpUtil.post(
                    HttpApi.LOGIN,
                        (data) async {
                      UserAccountUtil.saveLoginInfo(_nameCtrl.text).then((r) {
                        BaseConst.eventBus.fire(LoginEvent());
                        Navigator.of(context).pop();
                      });
                    },
                    params: map,
                    errorCallback: (msg) {
                      _showMessage(msg);
                    });*/
              },
            ),
          )
        ],
      ),
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey;

  void _showMessage(String msg) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }

  Widget _getBody() => Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Image.asset("assets/images/ic_login_bg.png"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                "欢迎来到小寓优品",
                style: TextStyle(fontSize: 24),
              ),
            ),
            _getLoginArea(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                "assets/images/ic_login_logo.png",
                width: 60,
              ),
            )
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BaseConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: GlobalConfig.themeData,
      home: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
          child: _getBody(),
        ),
      ),
    );
  }
}
