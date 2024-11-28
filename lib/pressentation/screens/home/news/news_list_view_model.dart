import 'package:flutter_application_3/api/api_services.dart';
import 'package:flutter_application_3/datamodel/News_responce/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState(message: 'Loading...'));

  void getNews(String sourceId) async {
    try {
      var response = await ApiManger.getNews(sourceId);
      if (response.message == 'error') {
        emit(ErrorState(errorMessage: response.message));
      } else {
        emit(SuccessState(newsList: response.articles));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsListState {}

class LoadingState extends NewsListState {
  String? message;

  LoadingState({this.message});
}

class SuccessState extends NewsListState {
  List<News>? newsList;

  SuccessState({this.newsList});
}

class ErrorState extends NewsListState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}