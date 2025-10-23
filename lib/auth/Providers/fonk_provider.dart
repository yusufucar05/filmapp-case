import 'dart:io';

import 'package:filmapp/auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FonkProvider extends ChangeNotifier {
  UserModel? user;
  UserModel? modeluser;
  String? durum;
  bool controlState = false;

  Future<bool> dataSaveFonk(String name, String mail, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (name.isNotEmpty && mail.isNotEmpty && password.isNotEmpty) {
        await prefs.setString('name', name);
        await prefs.setString('mail', mail);
        await prefs.setString('password', password);
        user = UserModel(name: name, mail: mail, password: password);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint("Kayıt hatası: $e");
      return false;
    }
  }

  Future<void> signUpFonk({
    required String name,
    required String mail,
    required String password,
    required String rePassword,
  }) async {
    if (mail.isEmpty || name.isEmpty || password.isEmpty) {
      durum = "Lütfen tüm alanları doldurun";
      controlState = false;
      notifyListeners();
      return;
    }

    if (password != rePassword) {
      durum = "Şifreler eşleşmiyor";
      controlState = false;
      notifyListeners();
      return;
    }

    final success = await dataSaveFonk(name, mail, password);
    if (success) {
      durum = "Kayıt başarılı";
      controlState = true;
    } else {
      durum = "Kayıt başarısız";
      controlState = false;
    }
    notifyListeners();
  }

  Future<void> loginFonk({
    required String mailAdd,
    required String passwordAdd,
  }) async {
    if (mailAdd.isEmpty || passwordAdd.isEmpty) {
      durum = "Email ve şifre boş olamaz";
      controlState = false;
      notifyListeners();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final savedMail = prefs.getString('mail');
    final savedPassword = prefs.getString('password');

    if (savedMail == mailAdd && savedPassword == passwordAdd) {
      final name = prefs.getString('name') ?? '';
      readUser();
      user = UserModel(name: name, mail: mailAdd, password: passwordAdd);
      durum = "Giriş başarılı";
      controlState = true;
    } else {
      durum = "Email veya şifre hatalı";
      controlState = false;
    }
    notifyListeners();
  }

  ///image yükleme
  XFile? xfile;
  File? selectedImage;
  Future<void> cameraSelect(bool? camera) async {
    final image = ImagePicker();

    if (camera == true) {
      xfile = await image.pickImage(source: ImageSource.camera);
      notifyListeners();
    } else {
      xfile = await image.pickImage(source: ImageSource.gallery);
      notifyListeners();
    }
    if (xfile != null) {
      selectedImage = File(xfile!.path);
      notifyListeners();
    }
  }

  bool visible = false;
  iconVisible() {
    visible = !visible;
    debugPrint('aktiflik $visible');

    notifyListeners();
  }

  String username = "";
  Future<void> readUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    username = prefs.getString('name') ?? '';

    print('Username: $username');
  }
}
