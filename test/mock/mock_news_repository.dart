
import 'package:news_app/model/news_fetch_response_models.dart';
import 'package:news_app/repository/news_repository.dart';

class MockNewsRepository implements NewsRepositoryInterface {
  var isFetchNewsDataCalled = false;
  final Future<NewsFetchResponseModels> models = Future(() => NewsFetchResponseModels());

  @override
  Future<NewsFetchResponseModels> fetchNewsData() {
    isFetchNewsDataCalled = true;
    return models;
  }
}