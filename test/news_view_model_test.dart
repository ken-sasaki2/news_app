
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/datastore/news_fetch_datastore.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:test/test.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'mock/mock_news_repository.dart';

void main() {
  test('repositoryのfetchNewsDataが呼ばれたことが確認できる', () {
    final repository = MockNewsRepository();
    final viewModel = NewsViewModel(repository: repository);
    viewModel.fetchNewsData();

    expect(repository.isFetchNewsDataCalled, isTrue);
  });

  test('viewModelのnewsに値が格納されている', () async {
    final dataStore = NewsFetchDataStore(dio: Dio());
    final repository = NewsRepository(dataStore: dataStore);
    final viewModel = NewsViewModel(repository: repository);
    await viewModel.fetchNewsData();

    viewModel.news.datas.forEach((data) {
      debugPrint('news:${data.title}');
    });

    expect(viewModel.news.datas, isNotEmpty);
  });
}