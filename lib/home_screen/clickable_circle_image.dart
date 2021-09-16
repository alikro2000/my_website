import 'package:flutter/material.dart';
import 'dart:html' as html;

class ClickableCircleImage extends StatelessWidget {
  final String imageLocation;
  final String clickedURL;

  const ClickableCircleImage({
    Key? key,
    required this.imageLocation,
    required this.clickedURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imageLocation,
          width: 50,
        ),
      ),
      onTap: () {
        html.window.open(clickedURL, '_blank');
      },
    );
  }
}
