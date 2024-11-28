import 'package:flutter/material.dart';
import 'package:flutter_application_3/datamodel/source_responce/source.dart';
import 'package:flutter_application_3/pressentation/screens/home/news/news_item_widget.dart';
import 'package:flutter_application_3/pressentation/screens/home/news/news_list_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListWidget extends StatefulWidget {
  Source source;

  NewsListWidget({required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<NewsListViewModel, NewsListState>(
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
                    Text(state.errorMessage!),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                ),
              );
            }
          case SuccessState():
            {
              var newsList = state.newsList;

              return Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) => NewsItemWidget(
                          news: newsList![index],
                        ),
                    itemCount: newsList?.length ?? 0),
              );
            }
        }
      },
    );
  }
}