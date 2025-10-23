import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  double? width;
  Widget? child;
  CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFE50914),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: width,

        height: 60,
        child: Align(child: child, alignment: Alignment.center),
      ),
    );
  }
}
