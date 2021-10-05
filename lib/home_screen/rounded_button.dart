import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../constants.dart';
import 'clickable_circle_image.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final String prefixImageLocation;
  final String onClickedURL;
  final EdgeInsets padding;
  final double borderRadius;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.width,
    required this.prefixImageLocation,
    required this.onClickedURL,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kLightBrownColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              ClickableCircleImage(
                clickedURL: onClickedURL,
                imageLocation: prefixImageLocation,
              ),
              SizedBox(width: 5),
              Text('$text', style: kMenuHeaderTextStyle),
            ],
          ),
        ),
        onPressed: () {
          html.window.open(onClickedURL, '_blank');
        },
      ),
    );
  }
}
