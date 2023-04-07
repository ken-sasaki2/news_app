
import 'package:news_app/model/news_fetch_response_models.dart';

abstract class NewsRepositoryInterface {
  Future<NewsFetchResponseModels> fetchNewsData();
}