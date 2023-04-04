
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/news_fetch_datastore_provider.dart';
import 'package:news_app/repository/news_repository.dart';

final newsRepositoryProvider = Provider<NewsRepositoryInterface>(
        (ref) => NewsRepository(dataStore: ref.read(newsFetchDataStoreProvider))
);