
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/application/secret.dart';
import 'package:news_app/model/news_fetch_response_model.dart';
import 'package:news_app/model/news_fetch_response_models.dart';

abstract class NewsFetchDataStoreInterface {
  Future<NewsFetchResponseModels> fetchNewsData();
}

class NewsFetchDataStore extends NewsFetchDataStoreInterface {
  final dio = Dio();

  @override
  Future<NewsFetchResponseModels> fetchNewsData() async {
    const url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=';

    try {
      final response = await dio.get(url);
      final responseData = response.data;
      final List<dynamic> datas = responseData['articles'];
      final models = NewsFetchResponseModels();

      datas.forEach((data) {
        final model = NewsFetchResponseModel.fromData(data);
        models.datas.add(model);
      });
      debugPrint('model:${models.datas[0].title}');

      return models;
    } on Exception catch(exception) {
      debugPrint('exception:$exception');

      throw NewsApiException(exception.toString());
    } on Error catch(error) {
      debugPrint('error:$error');

      rethrow;
    }
  }
}


class NewsApiException implements Exception {
  final String message;
  const NewsApiException(this.message);

  @override
  String toString() => message;
}