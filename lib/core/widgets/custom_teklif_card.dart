import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTeklifCard extends StatelessWidget {
  String discount;
  String bottomTextOne;
  String bottomTextTwo;
  String centerTextTwo;
  String centerTextOne;
  String topText;
  List<Color> colors;
  List<Color> topColors;

  CustomTeklifCard({
    super.key,
    required this.discount,
    required this.bottomTextOne,
    required this.bottomTextTwo,
    required this.centerTextTwo,
    required this.centerTextOne,
    required this.topText,
    required this.colors,
    required this.topColors,
  });

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.transparent,
      height: 230,
      child: Stack(
        alignment: Alignment(0, -1),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Container(
              width: screen.width / 3.5,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: colors,
                  radius: 3,
                  center: AlignmentGeometry.xy(-1, -1),
                  //transform: GradientRotation(6.200),
                  //begin: AlignmentGeometry.directional(0, -0.4),
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    topText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    centerTextOne,
                    style: TextStyle(
                      color: Colors.white,

                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 2.2,
                  ),
                  Text(
                    centerTextTwo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    bottomTextOne,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bottomTextTwo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          ///indirim yazısı en tepedeki
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white),
              gradient: RadialGradient(colors: topColors),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(discount, style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
