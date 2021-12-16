import 'package:flutter/material.dart';
import 'package:spotify_clone/modules/home/widget/items/grid_home_item.dart';

class GridHome extends StatelessWidget {
  const GridHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 100 / 40),
        itemBuilder: (context, index) {
          return const GridHomeItem();
        });

    // return GridView.count(
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 10,
    //   children: const [
    //     GridHomeItem(),
    //     GridHomeItem(),
    //     GridHomeItem(),
    //   ],
    // );
  }
}
