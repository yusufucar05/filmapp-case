import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLikeCard extends StatelessWidget {
  String assetName;
  String tags;
  String producName;
  CustomLikeCard({
    super.key,
    required this.assetName,
    required this.tags,
    required this.producName,
  });

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screen.width / 2.5,
            height: screen.height / 3.7,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetName),
                fit: BoxFit.cover,
              ),
              //border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
          Text(""),
          Text(
            tags,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            producName,
            style: TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
