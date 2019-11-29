import 'package:flutter/material.dart';

import 'skeleton.dart';

class OrderSkeletonItem extends StatelessWidget {
  final int index;

  OrderSkeletonItem({this.index: 0});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: Divider.createBorderSide(context,
                  width: 0.7, color: Colors.redAccent))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 20,
                width: 20,
                decoration: SkeletonDecoration(isCircle: true),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 5,
                width: 100,
                decoration: SkeletonDecoration(),
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                height: 5,
                width: 30,
                decoration: SkeletonDecoration(),
              ),
            ],
          ),
          SizedBox(
            height: 0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 6.5,
                width: width * 0.7,
                decoration: SkeletonDecoration(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 6.5,
                width: width * 0.8,
                decoration: SkeletonDecoration(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 6.5,
                width: width * 0.5,
                decoration: SkeletonDecoration(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 8,
                width: 20,
                decoration: SkeletonDecoration(),
              ),
              Container(
                height: 8,
                width: 80,
                decoration: SkeletonDecoration(),
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                height: 20,
                width: 20,
                decoration: SkeletonDecoration(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
