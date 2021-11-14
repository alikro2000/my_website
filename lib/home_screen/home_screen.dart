import 'package:flutter/material.dart';
import 'package:my_website/constants.dart';
import 'dart:math' as math;
import 'dart:html' as html;
import 'package:my_website/home_screen/clickable_circle_image.dart';

import 'home_screen_left_rectangle.dart';
import 'home_screen_top_menu_bar.dart';
import 'rounded_button.dart';

class HomeScreen extends StatelessWidget {
  late Size _screenSize;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: _screenSize.width,
        child: Stack(
          children: [
            HomeScreenLeftRectangle(screenSize: _screenSize),
            Positioned(
              right: 0,
              top: 150,
              child: Container(
                // height: double.infinity,
                width: _screenSize.width / 2,
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.asset(
                        'assets/images/pp.png',
                        width: 400,
                      ),
                    ),
                    SizedBox(height: 50),
                    RoundedButton(
                      text: 'Download my CV',
                      width: 320,
                      prefixImageLocation: 'assets/images/pdf_logo_01.png',
                      onClickedURL: 'https://www.google.com',
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Things I can help with',
                        style: kChipTextStyle,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        children: getSkillChips(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            HomeScreenTopMenuBar(),
          ],
        ),
      ),
    );
  }

  List<Chip> getSkillChips() {
    List<Chip> chips = [];
    for (int i = 0; i < 7; ++i) {
      chips.add(
        Chip(
            padding: EdgeInsets.all(8),
            label: Text('skill chip', style: kChipTextStyle),
            backgroundColor: kLightBrownColor),
      );
    }
    return chips;
  }
}
