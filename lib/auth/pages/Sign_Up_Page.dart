import 'package:email_validator/email_validator.dart';
import 'package:filmapp/core/widgets/custom_button.dart';
import 'package:filmapp/core/widgets/custom_sign_card.dart';
import 'package:filmapp/core/widgets/custom_text_form.dart';
import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/core/constants/auth_keys.dart';
import 'package:filmapp/auth/pages/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final TextEditingController userController = TextEditingController();
final TextEditingController mailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordTwoController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FonkProvider>(context, listen: true);
    var screen = MediaQuery.sizeOf(context);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      /// en üstteki yazı
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.9),
                        child: Column(
                          children: [
                            Text(
                              Keys.signUpText,
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
                      Column(
                        spacing: 10,
                        children: [
                          CustomTextFormField(
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "sanırım bişeyi unuttun";
                              }
                            },
                            obscureText: false,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny("  "),
                            ],

                            controller: userController,
                            prefixIcon: Image.asset(
                              "assets/Add-User-icon.png",
                              color: Colors.white,
                            ),
                            hint: Text(
                              Keys.nameSurName,
                              style: const TextStyle(color: Colors.white54),
                            ),
                          ),
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
                            keyboardType: TextInputType.emailAddress,
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
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "sanırım bişeyi unuttun";
                              }
                              if (value.contains(RegExp(r'[A-Z]'))) {
                              } else {
                                return "Şifre de en az bir buyuk harf olacak";
                              }
                              if (value.contains(RegExp(r'[0-9]'))) {
                              } else {
                                return "Şifre en az bir rakam içermelidir";
                              }
                              if (value.length < 8) {
                                return "Şifre en az 8 karakter olmalıdır";
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
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "sanırım bişeyi unuttun";
                              } else if (passwordController.text !=
                                  passwordTwoController.text) {
                                return "şifreler aynı olmalıdır";
                              }
                            },
                            obscureText: provider.visible,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(" "),
                            ],
                            controller: passwordTwoController,
                            prefixIcon: Image.asset(
                              "assets/passicon.png",
                              color: Colors.white,
                            ),
                            hint: Text(
                              Keys.formReplacePasswordText,
                              style: const TextStyle(color: Colors.white54),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 25,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      Keys.sozlesmeTextOne,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AboutDialog(
                                            children: [
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                              ListTile(
                                                title: Text(Keys.appName),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Text(
                                        Keys.sozlesmeOntopText,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                          decorationStyle:
                                              TextDecorationStyle.wavy,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  Keys.sozlesmeTextTwo,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: CustomButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (passwordController.text ==
                                      passwordTwoController.text) {
                                    await provider.signUpFonk(
                                      name: userController.text,
                                      mail: mailController.text,
                                      password: passwordController.text,
                                      rePassword: passwordTwoController.text,
                                    );

                                    if (provider.controlState == true) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => SignInPage(),
                                        ),
                                        (route) => false,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: provider.durum!,
                                      );
                                    }
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Boş değer olamaz",
                                  );
                                }
                              },
                              child: Text(
                                Keys.singUpButtonText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
                                width: 50,
                                onTap: () => Fluttertoast.showToast(
                                  msg: "Bu özellik yakında aktif olacak",
                                ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Keys.singInBottomText,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const SignInPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  Keys.singInBottomOnTopText,
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
