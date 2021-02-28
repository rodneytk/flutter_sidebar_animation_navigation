import 'package:flutter/material.dart';
import 'package:flutter_sidebar_animation_navigation/sidebar/sidebar_layout.dart';
import 'package:flutter_sidebar_animation_navigation/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidebar Animation & Navigation Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
      ),
      home: SidebarLayout(),
    );
  }
}
