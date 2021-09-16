import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreenTopMenuBar extends StatelessWidget {
  const HomeScreenTopMenuBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          //Background image
          Image.asset('assets/images/top_menu_shapes_combined.png'),

          //Clickable texts
          Positioned(
            top: 40,
            left: 80,
            child: Row(
              children: [
                MenuHeaderText(text: 'Home', isSelected: true),
                SizedBox(width: 70),
                MenuHeaderText(text: 'Blog'),
                SizedBox(width: 70),
                MenuHeaderText(text: 'My Projects'),
                SizedBox(width: 70),
                MenuHeaderText(text: 'Contact'),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),

          //TODO: Hello text
          Positioned(
            top: 230,
            left: 80,
            child: Text(
              'Hello!',
              style: TextStyle(
                  fontSize: 54,
                  fontFamily: 'Pacifico',
                  color: kTextColor,
                  shadows: [
                    Shadow(
                      color: kTextShadowColor,
                      offset: Offset.fromDirection(45, 5),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuHeaderText extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MenuHeaderText({
    Key? key,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: kMenuHeaderTextStyle.copyWith(
        decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
