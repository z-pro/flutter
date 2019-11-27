import 'package:flutter/material.dart';

class BottomLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: const Color(0xFFEEEEEE),
      padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Divider(height: 10.0,),
            flex: 1,
          ),
          new Text("已经到裙底了哦",style: new TextStyle(color: Theme.of(context).accentColor),),
          new Expanded(
            child: new Divider(height: 10.0,),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: const Color(0xFFEEEEEE),
      padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Divider(height: 10.0,),
            flex: 1,
          ),
          new Text("暂无数据",style: new TextStyle(color: Theme.of(context).accentColor),),
          new Expanded(
            child: new Divider(height: 10.0,),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
