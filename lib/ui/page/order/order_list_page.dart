import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyyp/consts/base_const.dart';
import 'package:xyyp/consts/global_config.dart';
import 'package:xyyp/ui/page/order/order_item.dart';
import 'package:xyyp/ui/widget/bottom_line.dart';
import 'package:xyyp/ui/widget/emptyview.dart';
import 'package:xyyp/ui/widget/order_skeleton_item.dart';
import 'package:xyyp/ui/widget/skeleton.dart';

class OrderListPage extends StatefulWidget {
  final String title;

  OrderListPage(this.title);

  @override
  State<StatefulWidget> createState() => _OrderListPage();
}

class _OrderListPage extends State<OrderListPage> with AutomaticKeepAliveClientMixin {
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

  /// 加载哪个子组件
  Widget _choiceItemWidget(BuildContext context, int position) {
    if (position < listData.length) {
      if (listData[position] == BaseConst.END_LINE_TAG) {
        return BottomLine();
      }
      Map map = Map();
      map["title"] = "hha";
      return OrderItem(map);
    } else if (showMore) {
      return showMoreLoadingWidget();
    }
  }

  ScrollController _scrollController = ScrollController();

  Widget _getBody() {
    if ("已完成" == widget.title) {
      return EmptyView();
    }
    if (listData == null || listData.length <= 0) {
      return SkeletonList(
        builder: (context, index) => OrderSkeletonItem(),
      );
     /* return Center(
        child: CircularProgressIndicator(),
      );*/
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

  /// 加载更多提示组件
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
    return Center(
      child: Container(
        color: GlobalConfig.grey,
        child: _getBody(),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
/* @override
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
  }*/
}
