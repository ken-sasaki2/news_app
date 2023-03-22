
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Application/Secret.dart';
import 'package:news_app/Model/NewsFetchResponseModel.dart';
import 'package:news_app/Model/NewsFetchResponseModels.dart';

abstract class NewsFetchDataStoreInterface {
  Future<NewsFetchResponseModels> fetchNewsData();
}

class NewsFetchDataStore extends NewsFetchDataStoreInterface {

  @override
  Future<NewsFetchResponseModels> fetchNewsData() async {
    final dio = Dio();
    const url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=$key';

    final response = await dio.get(url);
    final responseData = response.data;
    final List<dynamic> datas = responseData['articles'];
    final models = NewsFetchResponseModels();

    datas.forEach((data) {
      final model = NewsFetchResponseModel.fromData(data);
      models.datas.add(model);
    });

    return models;
  }
}