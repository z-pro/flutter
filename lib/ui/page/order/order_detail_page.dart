import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyyp/consts/base_const.dart';
import 'package:xyyp/consts/global_config.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderDetailPage();
}

class _OrderDetailPage extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BaseConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: GlobalConfig.themeData,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "订单详情",
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
            elevation: 0.5,
          ),
          body: Container()),
    );
  }
}
