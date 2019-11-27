import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/page/order/order_detail_page.dart';

class OrderItem extends StatefulWidget {
  final itemData;

  OrderItem(this.itemData);

  @override
  State<StatefulWidget> createState() => _OrderItem();
}

class _OrderItem extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.5,
        child: FlatButton(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 14),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.question_answer,
                          color: Colors.red,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(widget.itemData['title']),
                        ),
                        Container(
                          padding: const EdgeInsets.only(),
                          child: new PopupMenuButton(
                              icon: new Icon(
                                Icons.linear_scale,
                                color: GlobalConfig.navBarItemColor,
                              ),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<String>>[
                                    new PopupMenuItem<String>(
                                        value: '选项一的值',
                                        child: new Text('屏蔽这个问题')),
                                    new PopupMenuItem<String>(
                                        value: '选项二的值',
                                        child: new Text('取消关注')),
                                    new PopupMenuItem<String>(
                                        value: '选项二的值', child: new Text("举报"))
                                  ]),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    indent: 1.0,
                    color: GlobalConfig.grey,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '''需要别人远程你的数据库需要别人远程你的数据库需要别人远程你的数据库''',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '''需要别人远程你的数据库需要别人远程你的数据库需要别人远程你的数据库''',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '''需要别人远程你的数据库需要别人远程你的数据库需要别人远程你的数据库''',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                            child: new Text("广告",
                                style: new TextStyle(
                                    fontSize: 10.0,
                                    color: GlobalConfig.navBarItemColor)),
                            decoration: new BoxDecoration(
                              border: new Border.all(
                                  color: GlobalConfig.jiangRoomYellow),
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(2.0)),
                            ),
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 2.0, left: 3.0, right: 3.0)),
                        new Expanded(
                            child: new Text("  查看详情",
                                style: new TextStyle(
                                    color: GlobalConfig.navBarItemColor))),
                        Listener(
                          child: new Icon(Icons.clear,
                              color: GlobalConfig.navBarItemColor),
                          onPointerDown: (p) {
                            print("ddd${p}");
                          },
                        )
                      ],
                    ),
                    padding: const EdgeInsets.only(bottom: 10.0),
                  )
                ],
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (b) => new OrderDetailPage()));
          },
        ));
  }
}
