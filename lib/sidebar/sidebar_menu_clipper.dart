import 'package:flutter/material.dart';
import 'package:flutter_sidebar_animation_navigation/theme.dart';

class SidebarMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = sidebarBackgroundColor;

    final double width = size.width;
    final double height = size.height;
    final double halfHeight = height / 2;
    final double baseY1 = 12;
    final double baseY1ofMiddle = 26;
    final double baseX2 = 16;
    final double baseY2 = 18;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, baseY1, baseX2, baseY2);
    path.quadraticBezierTo(
        width, halfHeight - baseY1ofMiddle, width, halfHeight);
    path.quadraticBezierTo(
        width, halfHeight + baseY1ofMiddle, baseX2, height - baseY2);
    path.quadraticBezierTo(0, height - baseY1, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
