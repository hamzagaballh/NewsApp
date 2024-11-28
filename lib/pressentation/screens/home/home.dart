import 'package:flutter/material.dart';
import 'package:flutter_application_3/datamodel/category_DM.dart';
import 'package:flutter_application_3/pressentation/screens/home/categories_tab_widget/categories_tab_widget.dart';
import 'package:flutter_application_3/pressentation/screens/home/category_details/category_details.dart';
import 'package:flutter_application_3/pressentation/screens/home/homedawer/homeserawer.dart';
import 'package:flutter_application_3/pressentation/screens/home/settings_tab_widget/settings_tab_widget.dart';
// import 'package:flutter_application_3/pressentation/screens/home/categories_tab_widget/categories_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTabWidget(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bg_pattern.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28))),
          title: Text('Route News App'),
          actions: [
              IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: TitleSearch(),
              );
              setState(() {});
            },
            icon: const Icon(Icons.search),
          )
          ],
        ),
        drawer: HomeDrawer(
          onDrawerMenuItemClicked: onDrawerMenuItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }
  
  late Widget selectedWidget;

  void onDrawerMenuItemClicked(DrawerMenuItem item) {
    if (DrawerMenuItem.categories == item) {
      selectedWidget = CategoriesTabWidget(
        onCategoryItemClicked: onCategoryItemClicked,
      );
      setState(() {});
    } else if (DrawerMenuItem.settings == item) {
      selectedWidget = SettingsTabWidget();
      setState(() {});
    }
    Navigator.pop(context);
  }

  void onCategoryItemClicked(CategoryDM category) {
    selectedWidget = CategoryDetails(category: category);
    setState(() {});
  }
}
// class TitleSearch extends SearchDelegate {
//   List<CategoryDM> catList = CategoryDM.getAllCategories();

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return Theme.of(context).copyWith(
//       hintColor: Colors.grey,
//     );
//   }
// }
class TitleSearch extends SearchDelegate {
  List<CategoryDM> catList = CategoryDM.getAllCategories();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

 @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return selectedCategory != null
        ? CategoryDetails(category: selectedCategory!)
        : Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CategoryDM> suggestions = query.isEmpty
        ? catList
        : catList
        .where(
          (category) =>
          category.title.toLowerCase().contains(query.toLowerCase()),
    )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final category = suggestions[index];
        return ListTile(
          title: Text(
            category.title,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
          ),
          onTap: () {
            query = category.title;
            selectedCategory = category;
            showResults (context);
          },
        );
      },
      itemCount: suggestions.length,
    );
  }

   CategoryDM? selectedCategory;

  void onCategorySelect(CategoryDM newCategory) {
    selectedCategory = newCategory;
  }


}
