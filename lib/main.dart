import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/bindings/application_bindings.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_module.dart';
import 'package:spotify_clone/modules/splash/splash_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ThemeConfig.title,
      theme: ThemeConfig.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashModule().routes,
        ...HomeModule().routes,
      ],
    );
  }
}
