import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "Escute alguma música ou poscast para adiciona-la ao seu histórico",
          textAlign: TextAlign.center,
          style: ThemeConfig().getTextStyle(fontSize: 21),
        ),
      ),
    );
  }
}
