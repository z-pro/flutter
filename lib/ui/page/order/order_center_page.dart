import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyyp/consts/base_const.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/page/order/order_list_page.dart';

class OrderCenterPage extends StatefulWidget {
  final String title;

  OrderCenterPage(this.title);

  final List<String> list = ["全部", "带查房", "已完成"];

  @override
  State<StatefulWidget> createState() => _OrderCenterPage();
}

class _OrderCenterPage extends State<OrderCenterPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  int _tapIdx=0;

  Widget _getBody() => DefaultTabController(
      length: widget.list.length,
      initialIndex:_tapIdx,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: TabBar(
            //isScrollable: true,
            labelColor: GlobalConfig.jiangRoomYellow,
            //Theme.of(context).accentColor,
            unselectedLabelColor: GlobalConfig.navBarItemColor,
            indicatorColor: GlobalConfig.jiangRoomYellow,
            controller: tabController,
            tabs: widget.list
                .map((title) => Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(title),
                    ))
                .toList(),
            onTap: (idx){
              setState(() {
                _tapIdx=idx;
                print("index:${idx}");
              });
            },
          ),
          body: TabBarView(
              controller: tabController,
              children:
                  widget.list.map((title) => OrderListPage(widget.list[_tapIdx])).toList())));

  @override
  void initState() {
    tabController = TabController(length: widget.list.length, vsync: this);
    this.tabController.addListener(() {
      setState(() {
        _tapIdx=tabController.index;
        print(this.tabController.index);
      });
      print(this.tabController.toString());
      print(this.tabController.length);
      print(this.tabController.previousIndex);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BaseConst.APP_NAME,
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 16, color: GlobalConfig.navBarItemColor),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: GlobalConfig.jiangRoomYellow,
              //textDirection: TextDirection.RTL,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0.1,
        ),
        body: _getBody(),
      ),
    );
  }
}
