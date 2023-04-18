import 'package:flutter/material.dart';
import 'package:my_app/CustomePage/cart_page.dart';
import 'package:my_app/CustomePage/home_page.dart';
import 'package:my_app/CustomePage/login_page.dart';
import 'package:my_app/cors/store.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/widgets/splash_screen.dart';
import 'package:my_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main(List<String> args) {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      initialRoute: MyRoutes.splashRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => cartPage(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
      },
    );
  }
}
