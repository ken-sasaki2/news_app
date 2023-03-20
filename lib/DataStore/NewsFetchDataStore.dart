import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Application/Secret.dart';

class NewsFetchDataStore {

  void fetchNewsData() async {
    final dio = Dio();
    const url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=$key';

    final response = await dio.get(url);
    debugPrint('response:$response');
  }
}
