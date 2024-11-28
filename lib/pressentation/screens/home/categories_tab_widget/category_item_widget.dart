import 'package:flutter/material.dart';
import 'package:flutter_application_3/datamodel/category_DM.dart';
// import 'package:flutter_application_3/datamodel/source_responce/category_DM.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryDM category;
  int index;

  CategoryItemWidget({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.bgColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(22),
              topLeft: Radius.circular(22),
              bottomLeft: Radius.circular(index.isEven ? 22 : 0),
              bottomRight: Radius.circular(index.isEven ? 0 : 22))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            height: 120,
          ),
          Text(
            category.title,
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}