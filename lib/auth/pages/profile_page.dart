import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/auth/model/user_model.dart';
import 'package:filmapp/core/constants/content_keys.dart';
import 'package:filmapp/core/widgets/custom_bottom_sheet_camera.dart';
import 'package:filmapp/core/widgets/custom_like_card.dart';
import 'package:filmapp/core/widgets/cutom_bottom_sheet.dart';
import 'package:filmapp/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FonkProvider>(context);
    var screen = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          children: [
            ///[en üsttteki profil bar]
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.all(14.0)),
                      backgroundColor: WidgetStateProperty.all(Colors.white12),
                      iconColor: WidgetStateProperty.all(Colors.white),
                    ),
                  ),
                  Spacer(),
                  Title(
                    color: Colors.white,
                    child: Text(
                      "Profil Detayı",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  TextButton.icon(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => CustomBottomSheet(),
                    ),
                    label: Text(
                      "Sınırlı teklif",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    icon: Image.asset("assets/elmas-icon.png"),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color(0xFFE50914),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///[kullanıcı  barı burada]
            Padding(
              padding: EdgeInsetsGeometry.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(width: 1),
                    ),
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: provider.selectedImage == null
                          ? AssetImage("")
                          : FileImage(provider.selectedImage!),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      provider.username.isNotEmpty
                          ? Text(
                              provider.username,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "User Name",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                      Text(
                        "ID: " + "245672",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => CustomBottomSheetCamera(),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xFFE50914),
                      ),
                      padding: EdgeInsets.all(10),
                      height: 40,
                      child: Text(
                        "Fotoğraf ekle",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///[beğenilen içerikler]
            Container(
              width: screen.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Beğendiğim Filmler",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ///içerikler
            Container(
              width: screen.width,
              height: screen.height * 0.63,
              child: ListView(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.start,
                    children: [
                      for (int i = 0; i < ContentKeys.assetName.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: CustomLikeCard(
                            assetName: ContentKeys.assetName[i],
                            tags: ContentKeys.tags[i],
                            producName: ContentKeys.producer[i],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),

            /// navigator butonları
            Container(
              height: 40,
              width: screen.width,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => HomePage()),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.white24, width: 2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/home-icon.png",
                              color: Colors.white,
                              height: 20,
                            ),
                            Text(
                              " Anasayfa",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screen.width * 0.1),

                  GestureDetector(
                    onTap: null,
                    child: Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.white24, width: 2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 30,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/user-head.png",
                                  color: Colors.white,
                                  height: 10,
                                ),
                                Image.asset(
                                  "assets/user-body.png",
                                  color: Colors.white,
                                  height: 10,
                                ),
                              ],
                            ),
                            Text(
                              " Profil",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
