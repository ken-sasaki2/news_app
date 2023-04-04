
import 'package:test/test.dart';
import 'package:news_app/repository/news_repository.dart';
import 'mock/mock_news_fetch_datastore.dart';

void main() {
  test('fetchNewsDataが呼ばれたことが確認できる', () {
    final dataStore = MockNewsFetchDataStore();
    final repository = NewsRepository(dataStore: dataStore);
    repository.fetchNewsData();

    expect(dataStore.isFetchNewsDataCalled, isTrue);
  });
}