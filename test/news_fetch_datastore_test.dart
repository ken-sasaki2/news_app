
import 'package:news_app/datastore/news_fetch_datastore.dart';
import 'package:test/test.dart';


  void main() {
    test('APIのレスポンスがnilではない', () async {
      final dataStore = NewsFetchDataStore();
      final data = await dataStore.fetchNewsData();
      final result = data.datas.isNotEmpty;

      expect(result, true);
    });
  }