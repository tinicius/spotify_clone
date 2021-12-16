import 'package:flutter/material.dart';
import 'package:spotify_clone/modules/home/widget/grids/grid_home.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Boa Tarde"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.flash_on_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.history),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.inbox),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: const [Expanded(child: GridHome())],
      ),
    );
  }
}
