import 'package:email_validator/email_validator.dart';
import 'package:filmapp/core/widgets/custom_button.dart';
import 'package:filmapp/core/widgets/custom_sign_card.dart';
import 'package:filmapp/core/widgets/custom_text_form.dart';
import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/core/constants/auth_keys.dart';
import 'package:filmapp/auth/pages/Sign_Up_Page.dart';
import 'package:filmapp/auth/pages/profil_photo_update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final TextEditingController userController = TextEditingController();
final TextEditingController mailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordTwoController = TextEditingController();

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.sizeOf(context);
    var provider = Provider.of<FonkProvider>(context, listen: true);

    return Material(
      child: SafeArea(
        child: Container(
          height: screen.height,
          alignment: Alignment.bottomCenter,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(30.0),

            /// ana kolon
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: [
                      /// en üstteki yazı
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            Text(
                              Keys.signInText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Keys.signSubText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// formlar
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "sanırım bişeyi unuttun";
                          } else if (!EmailValidator.validate(value)) {
                            return "sanırım bişeyi unuttun";
                          }
                        },
                        obscureText: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(" "),
                        ],
                        controller: mailController,
                        prefixIcon: Image.asset(
                          "assets/Mailicon.png",
                          color: Colors.white,
                        ),
                        hint: Text(
                          Keys.formMailText,
                          style: const TextStyle(color: Colors.white54),
                        ),
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "sanırım şifreni unuttun";
                          }
                        },
                        obscureText: provider.visible,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(" "),
                        ],
                        controller: passwordController,
                        prefixIcon: Image.asset(
                          "assets/passicon.png",
                          color: Colors.white,
                        ),
                        hint: Text(
                          Keys.formPasswordText,
                          style: const TextStyle(color: Colors.white54),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.iconVisible();
                          },
                          icon: provider.visible == true
                              ? Icon(CupertinoIcons.eye_slash)
                              : Image.asset(
                                  "assets/Hide-pass-icon.png",
                                  color: Colors.white,
                                ),
                        ),
                      ),

                      ///şifremi unuttum yazısı
                      Column(
                        spacing: 25,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AboutDialog(
                                  children: [
                                    ListTile(title: Text(Keys.appName)),
                                    ListTile(title: Text(Keys.appName)),
                                    ListTile(title: Text(Keys.appName)),
                                    ListTile(title: Text(Keys.appName)),
                                    ListTile(title: Text(Keys.appName)),
                                    ListTile(title: Text(Keys.appName)),
                                    ListTile(title: Text(Keys.appName)),
                                  ],
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Keys.passwordHelpText,
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),

                          //// custom botton
                          SizedBox(
                            child: CustomButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (mailController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                      msg: "Email ve şifre girmedin",
                                    );
                                    return;
                                  }

                                  if (!EmailValidator.validate(
                                    mailController.text,
                                  )) {
                                    Fluttertoast.showToast(
                                      msg: "Geçerli bir email adresi gir",
                                    );
                                    return;
                                  }

                                  await provider.loginFonk(
                                    mailAdd: mailController.text,
                                    passwordAdd: passwordController.text,
                                  );

                                  if (provider.controlState) {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const ProfilPhotoUpdatePage(),
                                      ),
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                      msg:
                                          provider.durum ??
                                          "Giriş başarısız yeniden dene",
                                    );
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Boş değer olamaz",
                                  );
                                }
                              },
                              child: Text(
                                Keys.loginButtonText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          ///genel giriş butonları
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomSignCard(
                                onTap: () => Fluttertoast.showToast(
                                  msg: "Bu özellik yakında aktif olacak",
                                ),
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/google.png',
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 15),
                              CustomSignCard(
                                onTap: () => Fluttertoast.showToast(
                                  msg: "Bu özellik yakında aktif olacak",
                                ),
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/apple.png',
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 15),
                              CustomSignCard(
                                onTap: () => Fluttertoast.showToast(
                                  msg: "Bu özellik yakında aktif olacak",
                                ),
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/Vector.png',
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          /// en alttaki tıklanır yazı
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Keys.singUpBottomText,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  Keys.singUpBottomOnTopText,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
