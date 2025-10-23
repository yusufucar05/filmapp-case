import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/auth/pages/profile_page.dart';
import 'package:filmapp/core/constants/content_keys.dart';
import 'package:filmapp/core/widgets/custom_scroll_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FonkProvider>(context);
    var screen = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          children: [
            ///içerikler
            Container(
              width: screen.width,
              height: screen.height * 0.9,
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  for (int i = 0; i < ContentKeys.assetName.length; i++)
                    CustomScrollCard(
                      assetName: ContentKeys.assetName[i],
                      contentTitle: ContentKeys.contentTitle,
                      contentDescription: ContentKeys.contentDescription,
                      assetLogoName: ContentKeys.assetLogoName,
                    ),
                ],
              ),
            ),
            Spacer(),

            /// en alttaki bar
            Container(
              height: 40,
              width: screen.width,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: null,
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
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => ProfilePage()),
                    ),
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

/*
 Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bgimage.jpg"),
                    ),
                  ),

                  height: screen.height / 10 * 9.99,
                ),

                /// beğerni ikonu
                Positioned(
                  right: 20,
                  bottom: 200,
                  child: Container(
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
                ),
                Positioned(
                  bottom: 100,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/circular-logo.png"),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              "Günahkar Adam                      ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Committy every territories dogpile so. Last ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "they investigation modal ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  "Daha Fazası      ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //
              ],
            ),
          
Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: screen.width,
                    decoration: BoxDecoration(color: Colors.grey.shade900),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.home,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  " Anasayfa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screen.width * 0.1),

                        Container(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  " Profil",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
 */
