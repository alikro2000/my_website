import 'package:flutter/material.dart';

import '../../constants.dart';

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
          // Image.asset('assets/images/top_menu_shapes_combined.png'),
          TopCurve(),

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

          Positioned(
            top: 230,
            left: 80,
            child: Text(
              'Hello!',
              style: TextStyle(fontSize: 54, fontFamily: 'Pacifico', color: kTextColor, shadows: [
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

class TopCurve extends StatelessWidget {
  const TopCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(_screenWidth, (_screenWidth * 0.25282154889060954).toDouble()),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4403970, size.height * 0.2734821);
    path_0.cubicTo(size.width * 0.3818765, size.height * 0.01302315, size.width * 0.3818765, size.height * 0.3841759,
        size.width * 0.2773758, size.height * 0.3581296);
    path_0.cubicTo(size.width * 0.1728752, size.height * 0.3320833, size.width * 0.1319116, size.height * 0.7260291,
        size.width * 0.07840701, size.height * 0.6381243);
    path_0.cubicTo(size.width * 0.02490244, size.height * 0.5502196, size.width * 0.01570735, size.height * 0.01302315,
        size.width * -0.01271684, size.height * 0.06837104);
    path_0.cubicTo(size.width * -0.04114103, size.height * 0.1237189, size.width * 0.01236302, size.height * -0.3125475,
        size.width * 0.01236302, size.height * -0.3125475);
    path_0.lineTo(size.width * 0.9545373, size.height * -0.3125475);
    path_0.cubicTo(size.width * 0.9545373, size.height * -0.3125475, size.width * 1.011429, size.height * -0.1454086,
        size.width * 0.9050190, size.height * -0.08853147);
    path_0.cubicTo(size.width * 0.7986094, size.height * -0.03165431, size.width * 0.7223986, size.height * 0.009853056,
        size.width * 0.6044863, size.height * 0.2734821);
    path_0.cubicTo(size.width * 0.4865740, size.height * 0.5371112, size.width * 0.4403970, size.height * 0.2734821,
        size.width * 0.4403970, size.height * 0.2734821);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffe8c7b2).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    canvas.drawShadow(path_0, Colors.grey.shade100.withOpacity(0.2), 5, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
