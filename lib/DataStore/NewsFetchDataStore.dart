
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Application/Secret.dart';
import 'package:news_app/Model/NewsFetchResponseModel.dart';
import 'package:news_app/Model/NewsFetchResponseModels.dart';

abstract class NewsFetchDataStoreInterface {
  Future<NewsFetchResponseModels> fetchNewsData();
}

class NewsFetchDataStore extends NewsFetchDataStoreInterface {
  final dio = Dio();

  @override
  Future<NewsFetchResponseModels> fetchNewsData() async {
    const url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=$key';

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
    } catch(error) {
      rethrow;
    }
  }
}