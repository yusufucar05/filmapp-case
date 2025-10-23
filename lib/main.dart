import 'package:filmapp/auth/Providers/fonk_provider.dart';
import 'package:filmapp/auth/pages/profile_page.dart';
import 'package:filmapp/core/constants/auth_keys.dart';
import 'package:filmapp/auth/pages/sign_in_page.dart';
import 'package:filmapp/home/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FonkProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Keys.appName,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignInPage());
  }
}
