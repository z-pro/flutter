import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  SkeletonBox(
      {@required this.width, @required this.height, this.isCircle: false});

  @override
  Widget build(BuildContext context) {
    Divider.createBorderSide(context, width: 0.7);

    return Container(
      width: width,
      height: height,
      decoration: SkeletonDecoration(),
    );
  }
}

class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({isCircle: false})
      : super(shape: isCircle ? BoxShape.circle : BoxShape.rectangle,color:Colors.grey);
}

class BottomBorderDecoration extends BoxDecoration {
  BottomBorderDecoration()
      : super(border: Border(bottom: BorderSide(width: .3)),color:Colors.grey);
}

class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder builder;
  final int length;

  SkeletonList(
      {this.length: 6,
      this.padding = const EdgeInsets.all(7.0),
      @required this.builder});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
          period: Duration(milliseconds: 1200),
          enabled: true,
          baseColor: Colors.grey[700],
          highlightColor: Colors.grey[500],
          child: Padding(
              padding: padding,
              child: Column(
                children:
                    List.generate(length, (index) => builder(context, index)),
              ))),
    );
  }
}
