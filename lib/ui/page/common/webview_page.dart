import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xyyp/consts/global_config.dart';

class WebviewPage extends StatefulWidget{
  final String title;
  final String url;
  WebviewPage({Key key,@required  this.title,@required this. url}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_WebviewPage();
}

class _WebviewPage extends State<WebviewPage>{
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onDestroy.listen((_){
      Navigator.of(context).pop();
    });
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(
          widget.title,
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
/*      appBar: AppBar(
        title: Text(widget.title),
      ),*/
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}