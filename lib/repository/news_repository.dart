
import 'package:flutter/material.dart';
import 'package:news_app/datastore/news_fetch_datastore.dart';
import 'package:news_app/model/news_fetch_response_models.dart';

abstract class NewsRepositoryInterface {
  Future<NewsFetchResponseModels> fetchNewsData();
}

class NewsRepository implements NewsRepositoryInterface {
  final NewsFetchDataStoreInterface dataStore;
  NewsRepository({required this.dataStore});

  @override
  Future<NewsFetchResponseModels> fetchNewsData() async {
    try {
      final data = await dataStore.fetchNewsData();
      return data;
    } on Exception catch(exception) {
      rethrow;
    } finally {
      debugPrint('End fetchNewsData from repository.');
    }
  }
}