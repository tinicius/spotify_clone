import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/search_bar.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/search_custom_delegate.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/section.dart';

class PageTwo extends GetView<HomeController> {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text(
                  "Buscar",
                  style: ThemeConfig().getTextStyle(fontSize: 24),
                ),
              )
            ];
          },
          body: ListView(
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () => showSearch(
                  context: context,
                  delegate: SearchCustomDelegate(),
                ),
                child: const SearchBar(),
              ),
              Obx(() {
                return controller.allSections.isNotEmpty
                    ? Section(
                        title: "Navegar por todas seções",
                        items: controller.allSections,
                      )
                    : Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
