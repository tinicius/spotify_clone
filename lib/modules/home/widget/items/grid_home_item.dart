import 'package:flutter/material.dart';

class GridHomeItem extends StatelessWidget {
  const GridHomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "a",
            style: TextStyle(color: Colors.red),
          )),
    );
  }
}
