import 'package:flutter/material.dart';

import '../../constants.dart';
import 'clickable_circle_image.dart';

class HomeScreenLeftRectangle extends StatelessWidget {
  const HomeScreenLeftRectangle({
    Key? key,
    required Size screenSize,
  })  : _screenSize = screenSize,
        super(key: key);

  final Size _screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 400, left: 80, right: 80, bottom: 50),
      width: _screenSize.width / 2 - 50,
      height: _screenSize.height,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
        color: kLightBrownColor,
        boxShadow: [
          BoxShadow(blurRadius: 15, spreadRadius: 10, color: Colors.grey, offset: Offset.fromDirection(0, 1)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            // color: Colors.indigo,
            child: Text(
              'Insert Text Here.',
              style: kDescriptionTextStyle,
            ),
          ),
          SizedBox(height: 100),
          Container(
            width: 350,
            height: 5,
            decoration: BoxDecoration(
              color: kTextColor,
              boxShadow: [
                BoxShadow(
                  color: kTextShadowColor,
                  offset: Offset.fromDirection(90, 3),
                  blurRadius: 5,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //TODO: Read the links from JSON?
              children: [
                ClickableCircleImage(
                  imageLocation: 'assets/images/instagram_logo_01.png',
                  clickedURL: '',
                ),
                ClickableCircleImage(
                  imageLocation: 'assets/images/Linkedin_Logo_01.png',
                  clickedURL: '',
                ),
                ClickableCircleImage(
                  imageLocation: 'assets/images/github_logo_01.png',
                  clickedURL: '',
                ),
                ClickableCircleImage(
                  imageLocation: 'assets/images/twitter_logo_01.png',
                  clickedURL: '',
                ),
                ClickableCircleImage(
                  imageLocation: 'assets/images/youtube_logo_01.png',
                  clickedURL: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
