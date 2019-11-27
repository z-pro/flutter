import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/page/notice/notice_center_page.dart';

class WorkbenchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkbenchPage();
}

class _WorkbenchPage extends State<WorkbenchPage> {
  Widget _getHeader() {
    return Container(
        constraints: BoxConstraints.expand(height: 180),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("assets/images/ic_home_bg.png"),
            //fit: BoxFit.fitWidth,
            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        top: 48.0, bottom: 2.0, left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(4.0),
                                width: 50,
                                child: AspectRatio(
                                  aspectRatio: 1.0 / 1.0,
                                  child: Container(
                                    foregroundDecoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://pic2.zhimg.com/50/v2-55039fa535f3fe06365c0fcdaa9e3847_400x224.jpg"),
                                          centerSlice: const Rect.fromLTRB(
                                              150.0, 150.0, 150.0, 150.0),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      child: Container(
                                        child: Text(
                                          "袁松",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        width: 90,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    Align(
                                      child: Container(
                                        child: Text(
                                          "配置操作专员",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        width: 90,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        new Expanded(
                            child: new Container(
                          child: new Text(""),
                        )),
                        IconButton(
                          icon: Icon(
                            Icons.add_alert,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => new NoticeCenterPage()));
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带查房",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: <Widget>[
                        Text("1",
                            style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "已通过",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _getNotification() {
    return Container(
      height: 32,
      padding: EdgeInsets.only(left: 4),
      width: MediaQuery.of(context).size.width,
      color: GlobalConfig.jiangRoomYellow,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.flash_on,
              color: Colors.white,
            ),
          ),
          Container(
            child: Text(
              "今天996搞起",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _getItem1() {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(10),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6, 16, 6, 10),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.ring_volume),
                    Text(
                      "待提交房源",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GlobalConfig.navBarItemColor),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6, 16, 6, 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 12,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalConfig.navBarItemColor,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 12,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalConfig.navBarItemColor,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 12,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalConfig.navBarItemColor,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getItem2() {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6, 16, 6, 4),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.flash_on),
                    Text(
                      "待整改房源",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GlobalConfig.navBarItemColor),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6, 16, 6, 16),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 12,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalConfig.navBarItemColor,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 12,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalConfig.navBarItemColor,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 12,
                    child: Column(
                      children: <Widget>[
                        Text("0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalConfig.navBarItemColor,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "带复核",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _pullToRefresh() async {
    return null;
  }

  ScrollController _scrollController = ScrollController();

  _WorkbenchPage() {
    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;

      /*if (maxScroll == pixels && listData.length < listTotalSize) {
        getHomeArticlelist();
      }*/
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  return Center(
      child: CircularProgressIndicator(),
    );*/

    return RefreshIndicator(
        color: GlobalConfig.jiangRoomYellow,
        child: ListView.builder(
            itemCount: 1,
            //控制始终都能滑动
            physics: AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    _getHeader(),
                    _getNotification(),
                    _getItem1(),
                    _getItem2()
                  ],
                ),
              );
            }),
        onRefresh: _pullToRefresh);
  }

/*@override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          _getHeader(),
          _getNotification(),
          _getItem1(),
          _getItem2()
        ],
      ),
    );
  }*/

}
