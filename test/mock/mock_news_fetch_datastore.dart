
import 'package:news_app/datastore/news_fetch_datastore.dart';
import 'package:news_app/model/news_fetch_response_models.dart';

class MockNewsFetchDataStore implements NewsFetchDataStoreInterface {
  var isFetchNewsDataCalled = false;
  final Future<NewsFetchResponseModels> models = Future(() => NewsFetchResponseModels());

  @override
  Future<NewsFetchResponseModels> fetchNewsData() {
    isFetchNewsDataCalled = true;

    return models;
  }
}