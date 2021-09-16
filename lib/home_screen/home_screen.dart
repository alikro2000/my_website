import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_screen_top_menu_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            HomeScreenTopMenuBar(),

            //TODO: The left side

            //TODO: The right side
          ],
        ),
      ),
    );
  }
}
