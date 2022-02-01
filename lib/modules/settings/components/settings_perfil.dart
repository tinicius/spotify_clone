import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class SettingsPerfil extends StatelessWidget {
  const SettingsPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.purple.shade400,
                radius: 25,
                child: Text(
                  "V",
                  style: ThemeConfig().getTextStyle(
                      fontColor: Colors.purple.shade900, fontSize: 24),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vinicius Alves",
                      style: ThemeConfig().getTextStyle(fontSize: 21)),
                  Text("Ver Perfil",
                      style: ThemeConfig().getTextStyle(
                          fontSize: 12, fontColor: ThemeConfig.grey)),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ThemeConfig.grey,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
