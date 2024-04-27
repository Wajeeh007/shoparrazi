import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparrazi/screens/auth/login/login_view.dart';
import 'helpers/constants.dart';
import 'helpers/theme_helper.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        brightness: Brightness.light,
        textTheme: TextThemes.textTheme(color: primaryTextGrey),
        appBarTheme: const AppBarTheme(
            color: Colors.white
        ),
        primaryColor: primaryGreen,
        indicatorColor: primaryGreen,
        unselectedWidgetColor: primaryTextGrey,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
            circularTrackColor: primaryLightGreen
        ),
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const LoginView(),
    );
  }
}
