import 'package:flutter/material.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/Section.dart';
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
                const SliverAppBar(
                  title: Text("Buscar"),
                )
              ];
            },
            body: ListView(
              shrinkWrap: true,
              children: [
                GestureDetector(
                    onTap: () {
                      showSearch(
                          context: context, delegate: SearchCustomDelegate());
                    },
                    child: SearchBar()),
                Section(
                  title: "Seus gêneros favoritos",
                )
              ],
            )),
      ),
    );
  }
}
