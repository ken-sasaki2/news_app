
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/datastore/news_fetch_datastore_interface.dart';
import 'package:news_app/datastore/news_fetch_datastore.dart';
import 'package:news_app/provider/dio_provider.dart';

final newsFetchDataStoreProvider = Provider<NewsFetchDataStoreInterface>(
        (ref) => NewsFetchDataStore(dio: ref.read(dioProvider))
);