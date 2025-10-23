import 'package:flutter/material.dart';

class CustomSignCard extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  void Function()? onTap;
  CustomSignCard({super.key, this.child, this.width, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white10,
          border: Border.all(width: 0.5),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  Widget? child;
  double? width;
  void Function()? onTap;
  double? height;
  ImageProvider<Object>? images;
  CustomCard({
    super.key,
    this.child,
    this.width,
    this.height,
    this.onTap,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        child: child,

        decoration: BoxDecoration(
          image: images != null
              ? DecorationImage(image: images!, fit: BoxFit.cover)
              : null,
          borderRadius: BorderRadius.all(Radius.circular(35)),

          color: Colors.white10,
          border: Border.all(color: Colors.white, width: 0.5),
        ),
      ),
    );
  }
}
