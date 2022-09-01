import 'package:clone_amazon_ui/pages/home/widgets/app_bar.dart';
import 'package:clone_amazon_ui/pages/home/widgets/books_list.dart';
import 'package:clone_amazon_ui/pages/home/widgets/header.dart';
import 'package:clone_amazon_ui/pages/home/widgets/icons_list.dart';
import 'package:clone_amazon_ui/pages/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...buildHeader(),
              buildSearchBar(),
              buildIconsList(),
              BuildBookList(),
            ],
          ),
        ));
  }
}
