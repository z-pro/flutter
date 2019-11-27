import 'package:flutter/material.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/page/notice/notice_center_page.dart';
import 'package:xyyp/ui/page/order/order_center_page.dart';
import 'package:xyyp/ui/page/order/order_list_page.dart';

class BusinessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage> {


  Widget _getHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
          top: 32.0, bottom: 2.0, left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Text("业务中心",
              style: TextStyle(fontSize: 16,
                  color: GlobalConfig.navBarItemColor,
                  fontWeight: FontWeight.bold)),
          new Expanded(
              child: new Container(
                child: new Text(""),
              )),
          IconButton(icon: Icon(Icons.add_alert),
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(
                  builder:(context)=>new NoticeCenterPage()
              ));
            },
            )
        ],
      ),
    );
  }

  Widget _getMain() {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Text("监察整改", style: TextStyle(
                fontSize: 20,
                color: GlobalConfig.navBarItemColor,
                fontWeight: FontWeight.bold
            )
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: const EdgeInsets.only(left: 6),
            margin: const EdgeInsets.all(4.0),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 4,
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (builder)=>new OrderCenterPage("新收订单")));
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: CircleAvatar(
                            radius: 20.0,
                            child: new Icon(
                                Icons.invert_colors, color: Colors.yellow),
                            backgroundColor: new Color(0xFFB88800),
                          ),
                        ),
                        Container(
                          child: new Text("新收订单", style: new TextStyle(
                              color: Colors.grey, fontSize: 12.0)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                  child: FlatButton(
                    onPressed: (){

                      Navigator.of(context).push(new MaterialPageRoute(builder: (builder)=>new OrderCenterPage("退租订单")));
                    },
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              child: new Icon(
                                  Icons.golf_course, color: Colors.redAccent),
                              backgroundColor: new Color(0xFF636269),
                            ),
                          ),
                          Container(
                            child: new Text("退租订单", style: new TextStyle(
                                color: Colors.grey, fontSize: 12.0)),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
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
          _getMain(),
        ],
      ),
    );
  }
}
