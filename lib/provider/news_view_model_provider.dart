
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news_fetch_response_models.dart';
import 'package:news_app/provider/news_repository_provider.dart';
import 'package:news_app/view_model/news_view_model.dart';

final newsViewModelNotifierProvider = FutureProvider<NewsFetchResponseModels>((ref) async {
   final viewModel = NewsViewModel(repository: ref.read(newsRepositoryProvider));
   await viewModel.fetchNewsData();

   return viewModel.news;
});