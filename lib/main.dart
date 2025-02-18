import 'dart:io';
import 'package:deepvidai/Utils/appConfig.dart';
import 'package:deepvidai/Utils/theme.dart';
import 'package:deepvidai/Welcome/loadingScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initializeAppInformation();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flexiple",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system, // Switches theme based on system settings
      home: LoadingScreen(), // Replace with WelcomeScreen after loading
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
