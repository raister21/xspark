import 'package:flutter/material.dart';

class DottedCustomClipper extends CustomClipper<Path> {
  final double maxWidth;
  final int quantityOfDots;
  final double individualWidth;
  final double lineHeight;
  DottedCustomClipper({
    @required this.maxWidth,
    @required this.quantityOfDots,
    @required this.individualWidth,
    @required this.lineHeight,
  });
  double pointX = 0;
  final double pointY = 0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    for (int i = 0; i < quantityOfDots / 2; i++) {
      path.addRect(Rect.fromLTWH(pointX, pointY, individualWidth, lineHeight));
      pointX += individualWidth * 2;
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
