import 'package:clone_amazon_ui/constants.dart';
import 'package:clone_amazon_ui/models/icons_list.dart';
import 'package:flutter/material.dart';

final List<IconModel> headerImages = IconModel.icons;

Widget buildIconsList() => Padding(
      padding: EdgeInsets.only(bottom: Constants.kPadding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            headerImages.length,
            (index) => Container(
              width: 100,
              child: Column(children: [Image.asset(headerImages[index].icon)]),
            ),
          ),
        ),
      ),
    );
