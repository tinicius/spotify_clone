import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/section.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/search_bar.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/search_custom_delegate.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                const Section(
                  title: "Seus gêneros favoritos",
                ),
                const Section(
                  title: "Seus gêneros favoritos",
                ),
                const Section(
                  title: "Seus gêneros favoritos",
                )
              ],
            )),
      ),
    );
  }
}
