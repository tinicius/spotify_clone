import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/bindings/application_bindings.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_module.dart';
import 'package:spotify_clone/modules/splash/splash_module.dart';
import 'package:spotify_clone/repositories/firebase_repository.dart';
import 'package:spotify_clone/repositories/remote_config_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseRepository firebase = FirebaseRepository();

  FirebaseOptions options = const FirebaseOptions(
      apiKey: "AIzaSyB32gV28dE6CKIsEJ-u_vpI_nNXInZNPYA",
      appId: "1:601459848463:android:89f5cb323bd02d4501fa7a",
      messagingSenderId: "601459848463",
      projectId: "spotify-clone-4bb77");

  await firebase.initialize(options);

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
