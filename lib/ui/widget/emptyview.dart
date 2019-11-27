import 'package:flutter/cupertino.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/empty_bg.png',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text('没有数据哦!'),
          ],
        ),
      ],
    );
  }
}
