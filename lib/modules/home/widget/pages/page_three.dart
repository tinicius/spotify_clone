import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/modules/home/widget/components/page_three_components/avatar_profile.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.setPageOneTitle();
        },
      ),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search_outlined),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_outlined),
            ),
          ),
        ],
        leading:  AvatarProfile(user: controller.user!,),
        title: const Text('Sua biblioteca'),
      ),
      body: Container(),
    );
  }
}
