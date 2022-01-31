import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  final SpotifyApiRepository _spotifyApiRepository = SpotifyApiRepository();

  TextEditingController textController = TextEditingController();

  void linkOnTap(String authLink) {
    launch(authLink);
  }

  Future<void> buttonOnTap() async {
    try {
      await _spotifyApiRepository.auth(code: textController.text);
      Get.offAllNamed("/home");
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Erro ao realizar login, tente novamente",
          duration: Duration(seconds: 3),
        ),
      );
      Get.offAllNamed("/login");
    }
  }

  //Build a Dialog to receive a code
  Widget dialog(String authLink) {
    return Material(
      child: Column(
        children: [
          const Text("Para logar realize os seguintes passos:"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("1. Clique "),
              InkWell(
                onTap: () {
                  linkOnTap(authLink);
                },
                child: Text(
                  "aqui",
                  style: ThemeConfig().getTextStyle(fontColor: Colors.blue),
                ),
              ),
              const Text(" e faça seu login"),
            ],
          ),
          const SizedBox(height: 5),
          const Text("2. Cole o código disponível na url (code=)"),
          const SizedBox(height: 5),
          const Text("3. Coloque o código no espaço abaixo"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await buttonOnTap();
              },
              child: const Text("Entrar"))
        ],
      ),
    );
  }

  Future<void> sign() async {
    if (kIsWeb) {
      String authLink = await _spotifyApiRepository.getAuthLink();
      Get.dialog(dialog(authLink));
    } else {
      await _spotifyApiRepository.auth();
      Get.offAllNamed("/home");
    }
  }
}
