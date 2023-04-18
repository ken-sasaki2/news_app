
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/provider/news_view_model_provider.dart';

class NewsWidget extends HookConsumerWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(newsViewModelNotifierProvider);

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        body: ListView(
            children: [
              newsItem('サンプル1', 'サブタイトル'),
              newsItem('サンプル2', 'サブタイトル'),
              newsItem('サンプル3', 'サブタイトル'),
              newsItem('サンプル4', 'サブタイトル'),
              newsItem('サンプル5', 'サブタイトル'),
              newsItem('サンプル6', 'サブタイトル'),
              newsItem('サンプル7', 'サブタイトル'),
              newsItem('サンプル8', 'サブタイトル'),
              newsItem('サンプル9', 'サブタイトル'),
              newsItem('サンプル10', 'サブタイトル'),
              newsItem('サンプル11', 'サブタイトル'),
              newsItem('サンプル12', 'サブタイトル'),
              newsItem('サンプル13', 'サブタイトル'),
              newsItem('サンプル14', 'サブタイトル'),
              newsItem('サンプル15', 'サブタイトル'),
            ],
        )
      ),
    );
  }

  Widget newsItem(String title, String author) {
    return GestureDetector(
      child:Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child:  Text(
                  title, 
                  style: const TextStyle(color:Colors.black, fontSize: 16.0),
                ),
              ),
              Text(author,
                style: const TextStyle(color:Colors.grey, fontSize: 12.0),
              ),
            ],
          )
      ),
      onTap: () {
        debugPrint("onTap called.");
      },
    );
  }
}