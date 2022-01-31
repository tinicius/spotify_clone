import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  final SpotifyApiRepository _spotifyApiRepository = SpotifyApiRepository();

  TextEditingController textController = TextEditingController();

  Future<void> sign() async {
    try {
      if (kIsWeb) {
        String authLink = await _spotifyApiRepository.getAuthLink();

        Get.dialog(
          Material(
            child: Container(
              height: 100,
              width: 100,
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
                          launch(authLink);
                        },
                        child: Text(
                          "aqui",
                          style: ThemeConfig()
                              .getTextStyle(fontColor: Colors.blue),
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
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await _spotifyApiRepository.auth(
                            code: textController.text);
                        Get.offNamed("/home");
                      },
                      child: const Text("Entrar"))
                ],
              ),
            ),
          ),
        );

        //_spotifyApiRepository.auth(code: textController.text);
      } else {
        await _spotifyApiRepository.auth();
        Get.offNamed("/home");
      }
    } catch (error) {
      print(error);
    }
  }

  void guestMode() {
    Get.offNamed("/home");
  }
}
