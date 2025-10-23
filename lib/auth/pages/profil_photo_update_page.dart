import 'package:filmapp/core/widgets/custom_button.dart';
import 'package:filmapp/core/widgets/custom_bottom_sheet_camera.dart';
import 'package:filmapp/core/widgets/custom_sign_card.dart';
import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProfilPhotoUpdatePage extends StatefulWidget {
  const ProfilPhotoUpdatePage({super.key});

  @override
  State<ProfilPhotoUpdatePage> createState() => _ProfilPhotoUpdatePageState();
}

final TextEditingController userController = TextEditingController();
final TextEditingController mailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordTwoController = TextEditingController();

class _ProfilPhotoUpdatePageState extends State<ProfilPhotoUpdatePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FonkProvider>(context);
    var provider2 = (context).watch<FonkProvider>();
    var screen = MediaQuery.sizeOf(context);
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screen.height,
            alignment: Alignment.bottomCenter,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(30.0),

              /// ana kolon
              child: Column(
                spacing: 30,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BackButton(
                        color: Colors.white,
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Profil Detayı",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.9),
                    child: Column(
                      children: [
                        Text(
                          "Fotoğraflarınızı yükleyin",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Resources out incentivize",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "relaxation floor loss cc.",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCard(
                    images: provider2.selectedImage != null
                        ? FileImage(provider.selectedImage!)
                        : null,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CustomBottomSheetCamera(),
                      );
                    },

                    child: provider.selectedImage == null
                        ? Icon(
                            CupertinoIcons.add,
                            color: Colors.white38,
                            size: 50,
                          )
                        : null,
                  ),
                  Spacer(),
                  CustomButton(
                    onPressed: () {
                      if (provider.selectedImage == null) {
                        Fluttertoast.showToast(
                          msg: "Lütfen bir resim yükleyin",
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: Text(
                      "Devam et",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
