import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xyyp/consts/base_const.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/widget/bottom_line.dart';

class NoticeListPage extends StatefulWidget {
  final String title;

  NoticeListPage(this.title);

  @override
  State<StatefulWidget> createState() => _NoticeListPage();
}

class _NoticeListPage extends State<NoticeListPage> {
  List listData = List();
  int curPage = 0;
  bool showMore = false;
  int listTotalSize = 0;

// final  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey=GlobalKey();

  Future _getDataList() async {
    //_refreshIndicatorKey.currentState?.show();
    //模拟网络延迟
    await Future.delayed(const Duration(seconds: 2), () {
      listTotalSize = 13;

      setState(() {
        showMore = false;
        if (listTotalSize <= listData.length) {
          listData.add(BaseConst.END_LINE_TAG);
          return;
        }
        for (var i = 0; i < 5; i++) {
          curPage++;
          listData.add("");
        }
      });
    });
  }

  /**
   * 加载哪个子组件
   */
  Widget _choiceItemWidget(BuildContext context, int position) {
    if (position < listData.length) {
      if (listData[position] == BaseConst.END_LINE_TAG) {
        return BottomLine();
      }
      return _getItem();
    } else if (showMore) {
      return showMoreLoadingWidget();
    }
  }

  ScrollController _scrollController = ScrollController();

  Widget _getBody() {
    if (listData == null || listData.length <= 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
        //key: _refreshIndicatorKey,
        color: GlobalConfig.jiangRoomYellow,
        onRefresh: _pullToRefresh,
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: listData.length,
            controller: _scrollController,
            itemBuilder: _choiceItemWidget));
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    await _getDataList();
    return null;
  }

  /**
   * 加载更多提示组件
   */
  Widget showMoreLoadingWidget() {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '加载中...',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _getItem() => Card(
        elevation: 0.5,
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
                        child: Text(widget.title),
                      ),
                      Text(new DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(DateTime.now()))
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
                  child: Text('''需要别人远程你的数据库，首先需要的是在一个局域网内，或者连接的是同一个路由器'''),
                )
              ],
            ),
          ),
        ),
      );

  @override
  void initState() {
    _getDataList();
    super.initState();
    //加载更多
    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        print('滑动到了最底部${_scrollController.position.pixels}');
        setState(() {
          showMore = true;
        });
        _getDataList();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: BaseConst.APP_NAME,
      debugShowCheckedModeBanner: false,
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
