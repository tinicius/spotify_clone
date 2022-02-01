import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          ":( Você ainda não tem nenhuma notificação ainda",
          textAlign: TextAlign.center,
          style: ThemeConfig().getTextStyle(fontSize: 21),
        ),
      ),
    );
  }
}
