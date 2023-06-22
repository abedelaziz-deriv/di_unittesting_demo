import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

const String mostPopularEmailed = 'mostpopular/v2/emailed/7.json';
const String mostPopularShared = 'mostpopular/v2/shared/7.json';
const String mostPopularViewed = 'mostpopular/v2/viewed/7.json';

const Map<String, String> queryParameters = <String, String>{
  'api-key': 'ADD-YOUR-KEY'
};

@singleton
class EndpointProvider {
  EndpointProvider(this.dio);

  final Dio dio;

  Future<ArticlesResponseModel> getMostEmailedArticles() async {
    final dynamic response =
        await dio.get(mostPopularEmailed, queryParameters: queryParameters);

    return ArticlesResponseModel.fromJson(json.decode(response.toString()));
  }

  Future<ArticlesResponseModel> getMostViewedArticles() async {
    final response =
        await dio.get(mostPopularViewed, queryParameters: queryParameters);

    return ArticlesResponseModel.fromJson(json.decode(response.toString()));
  }

  Future<ArticlesResponseModel> getMostSharedArticles() async {
    final response =
        await dio.get(mostPopularShared, queryParameters: queryParameters);

    return ArticlesResponseModel.fromJson(json.decode(response.toString()));
  }
}
