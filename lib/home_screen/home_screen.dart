import 'package:flutter/material.dart';

import 'home_screen_left_rectangle.dart';
import 'home_screen_top_menu_bar.dart';

class HomeScreen extends StatelessWidget {
  late Size _screenSize;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            HomeScreenLeftRectangle(screenSize: _screenSize),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: _screenSize.width / 2,
              ),
            ),
            HomeScreenTopMenuBar(),
          ],
        ),
      ),
    );
  }
}
