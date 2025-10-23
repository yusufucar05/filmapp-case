import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetCamera extends StatelessWidget {
  const CustomBottomSheetCamera({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.sizeOf(context);
    var provider = Provider.of<FonkProvider>(context);
    return Container(
      color: Colors.black87,
      height: screen.height / 6,
      width: screen.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: screen.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black38),
                ),
                onPressed: () => provider.cameraSelect(true),
                child: Text("kamera"),
              ),
            ),
            Container(
              width: screen.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black38),
                ),
                onPressed: () => provider.cameraSelect(false),
                child: Text("galeri"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
