import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Function onTap;
  final Widget content;
  final Color cardColor;
  final double circularRadius;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  const RoundedCard({
    Key key,
    @required this.onTap,
    @required this.content,
    this.width,
    this.height,
    this.cardColor = Colors.white,
    this.circularRadius = 4.0,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
            color: cardColor,
            margin: margin,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circularRadius)),
            child: content),
      ),
    );
  }
}
