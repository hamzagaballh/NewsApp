import 'package:flutter/material.dart';
import 'package:flutter_application_3/datamodel/category_DM.dart';
// import 'package:flutter_application_3/datamodel/source_responce/category_DM.dart';
import 'package:flutter_application_3/pressentation/screens/home/categories_tab_widget/category_item_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryDM category);

class CategoriesTabWidget extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;

  CategoriesTabWidget({required this.onCategoryItemClicked});

  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF4F5A69)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 25, crossAxisSpacing: 24, crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryItemClicked(categoriesList[index]);
                },
                child: CategoryItemWidget(
                  category: categoriesList[index],
                  index: index,
                ),
              ),
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}