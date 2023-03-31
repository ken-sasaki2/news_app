
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:news_app/datastore/news_fetch_datastore.dart';
import 'package:news_app/model/news_api_exception.dart';

  void main() {
    test('APIのレスポンスがnilではない', () async {
      final dataStore = NewsFetchDataStore(dio: Dio());
      final data = await dataStore.fetchNewsData();
      final result = data.datas.isNotEmpty;

      expect(result, true);
    });

    test('NewsApiException型のExceptionが返ってくる', () async {
      final dio = Dio(BaseOptions(validateStatus: (status) => false));
      final dataStore = NewsFetchDataStore(dio: dio);

      expect(() => dataStore.fetchNewsData(), throwsA(const TypeMatcher<NewsApiException>()));
    });
  }
