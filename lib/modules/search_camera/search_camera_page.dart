import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class SearchCameraPage extends StatelessWidget {
  const SearchCameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.waves,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Aponte sua câmera para um código Spotify",
                  textAlign: TextAlign.center,
                  style: ThemeConfig().getTextStyle(fontSize: 21),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Escolher das fotos",
                  style: ThemeConfig()
                      .getTextStyle(fontSize: 16, fontColor: ThemeConfig.grey),
                ),
              )
            ],
          ),
        ));
  }
}
