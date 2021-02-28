import 'package:flutter/material.dart';
import 'package:flutter_sidebar_animation_navigation/bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
