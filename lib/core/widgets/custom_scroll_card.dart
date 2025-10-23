import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollCard extends StatelessWidget {
  String assetName;

  String contentTitle;
  String contentDescription;
  String assetLogoName;
  CustomScrollCard({
    super.key,
    required this.assetName,
    required this.assetLogoName,
    required this.contentTitle,
    required this.contentDescription,
  });

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.sizeOf(context);
    return Container(
      height: screen.height * 0.9,
      width: screen.width,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
            ),
            height: screen.height,
            child: Image.asset(
              assetName,
              fit: BoxFit.cover,
              width: screen.width,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    width: 50,
                    height: 100,

                    child: Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        assetLogoName == null
                            ? Image.asset("assets/circular-logo.png")
                            : Image.asset(assetLogoName!),
                        SizedBox(width: 10),
                        Container(
                          width: screen.width * 0.77,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                contentTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                contentDescription,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Daha Fazası",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
