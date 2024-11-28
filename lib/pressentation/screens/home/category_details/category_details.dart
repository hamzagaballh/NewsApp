import 'package:flutter/material.dart';
import 'package:flutter_application_3/datamodel/category_DM.dart';
import 'package:flutter_application_3/pressentation/screens/home/category_details/category_details_viwe.dart';
import 'package:flutter_application_3/pressentation/screens/home/category_details/sources_tab_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDM category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
   
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                  child: Column(
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              ));
            }
          case SuccessState():
            {
              var sourcesList = state.sourcesList;
              return SourcesTabWidget(sources: sourcesList!);
            }
        }
      },
    );
  }
}