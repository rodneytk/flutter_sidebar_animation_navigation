import 'package:flutter/material.dart';
import 'package:flutter_sidebar_animation_navigation/theme.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  SidebarItem({@required this.icon, @required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: secondTextColor,
              size: 35,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: sidebarItemDefaultTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
