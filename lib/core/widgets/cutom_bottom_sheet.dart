import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/core/constants/content_keys.dart';
import 'package:filmapp/core/widgets/custom_button.dart';
import 'package:filmapp/core/widgets/custom_teklif_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.sizeOf(context);
    var provider = Provider.of<FonkProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        gradient: RadialGradient(
          colors: [
            Color(0xffE50914),
            Color(0xffE50914),
            Color(0xffE50914),
            Colors.black,
            Colors.black,
            Colors.black,
          ],
          center: AlignmentGeometry.directional(0, -1),
        ),
      ),
      height: screen.height * 0.8,
      width: screen.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 4,
          children: [
            Text(TeklifCard.offerText, style: TextStyle(color: Colors.white)),
            Text(
              TeklifCard.offerDescriptionTextOne,
              style: TextStyle(color: Colors.white),
            ),

            Text(
              TeklifCard.offerDescriptionTextTwo,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.white10,
              shadowColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  spacing: 1,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            TeklifCard.offerDescriptionTextThree,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 15,
                      children: [
                        Container(
                          width: screen.width / 6,
                          height: screen.width / 6,
                          decoration: BoxDecoration(
                            color: Color(0xff6F060B),
                            image: DecorationImage(
                              image: AssetImage("assets/pre-profil-icon.png"),
                            ),
                            borderRadius: BorderRadiusDirectional.circular(45),
                          ),
                        ),
                        Container(
                          width: screen.width / 6,
                          height: screen.width / 6,
                          decoration: BoxDecoration(
                            color: Color(0xff6F060B),
                            image: DecorationImage(
                              image: AssetImage("assets/mach-icon.png"),
                            ),
                            borderRadius: BorderRadiusDirectional.circular(45),
                          ),
                        ),
                        Container(
                          width: screen.width / 6,
                          height: screen.width / 6,
                          decoration: BoxDecoration(
                            color: Color(0xff6F060B),
                            image: DecorationImage(
                              image: AssetImage("assets/arrow-icon.png"),
                            ),
                            borderRadius: BorderRadiusDirectional.circular(45),
                          ),
                        ),
                        Container(
                          width: screen.width / 6,
                          height: screen.width / 6,
                          decoration: BoxDecoration(
                            color: Color(0xff6F060B),
                            image: DecorationImage(
                              image: AssetImage("assets/more-like.png"),
                            ),
                            borderRadius: BorderRadiusDirectional.circular(45),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 15,
                      children: [
                        Container(
                          width: screen.width / 6,
                          child: Text(
                            TeklifCard.bonusOne,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          width: screen.width / 6,
                          child: Text(
                            TeklifCard.bonusTwo,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          width: screen.width / 6,
                          child: Text(
                            TeklifCard.bonusThree,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          width: screen.width / 6,
                          child: Text(
                            TeklifCard.bonusFour,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    TeklifCard.centerText,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 5,

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTeklifCard(
                  topColors: [
                    Color.fromARGB(255, 187, 32, 21),
                    Color.fromARGB(255, 187, 32, 21),
                  ],
                  colors: [Color(0xFFE50914), Color(0xFFE50914)],
                  discount: TeklifCard.sectionOneTitle[0],
                  topText: TeklifCard.sectionOneJeton[0],
                  centerTextOne: TeklifCard.sectionOneJetonOld[0],
                  centerTextTwo: TeklifCard.jeton,
                  bottomTextOne: TeklifCard.sectionOnePrice[0],
                  bottomTextTwo: TeklifCard.sectionOnePriceTwo,
                ),
                CustomTeklifCard(
                  topColors: [Colors.deepPurple, Colors.deepPurple],
                  colors: [
                    Colors.deepPurple,
                    Colors.deepPurple,
                    Colors.pink,
                    Color(0xFFE50914),
                    Color(0xFFE50914),
                  ],

                  discount: TeklifCard.sectionOneTitle[1],
                  topText: TeklifCard.sectionOneJeton[1],
                  centerTextOne: TeklifCard.sectionOneJetonOld[1],
                  centerTextTwo: TeklifCard.jeton,
                  bottomTextOne: TeklifCard.sectionOnePrice[1],
                  bottomTextTwo: TeklifCard.sectionOnePriceTwo,
                ),
                CustomTeklifCard(
                  topColors: [
                    Color.fromARGB(255, 187, 32, 21),
                    Color.fromARGB(255, 187, 32, 21),
                  ],
                  colors: [Color(0xFFE50914), Color(0xFFE50914)],

                  discount: TeklifCard.sectionOneTitle[2],
                  topText: TeklifCard.sectionOneJeton[2],
                  centerTextOne: TeklifCard.sectionOneJetonOld[2],
                  centerTextTwo: TeklifCard.jeton,
                  bottomTextOne: TeklifCard.sectionOnePrice[2],
                  bottomTextTwo: TeklifCard.sectionOnePriceTwo,
                ),
              ],
            ),
            CustomButton(
              onPressed: () {},
              child: Text(
                TeklifCard.buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 3,
                ),
                textScaleFactor: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
