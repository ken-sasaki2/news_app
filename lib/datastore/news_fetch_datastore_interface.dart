
import 'package:news_app/model/news_fetch_response_models.dart';

abstract class NewsFetchDataStoreInterface {
  Future<NewsFetchResponseModels> fetchNewsData();
}