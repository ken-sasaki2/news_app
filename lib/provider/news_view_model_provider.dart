
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/news_repository_provider.dart';
import 'package:news_app/view_model/news_view_model.dart';

final newsViewModelNotifierProvider = ChangeNotifierProvider(
        (ref) => NewsViewModel(repository: ref.read(newsRepositoryProvider))
);