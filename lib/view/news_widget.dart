
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/news_view_model_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends ConsumerWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('News'),
            ),
            body: ref.watch(newsViewModelNotifierProvider).when(
                data: (articles) => ListView.builder(
                    itemCount: articles.datas.length,
                    itemBuilder: (_, index) {
                      final news = articles.datas[index];
                      return _newsItem(news.title, news.author, news.url);
                    }),
                error: (error, _) => const Center(
                    child: Text('通信エラー')
                ),
                loading: () => const Center(
                    child: CircularProgressIndicator()
                )
            )
        )
    );
  }

  Widget _newsItem(String title, String author, String url) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
              Text(author, style: const TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          )),
      onTap: () {
        _launchUrl(url);
      },
    );
  }

  Future _launchUrl(String url) async {
    final uri = Uri.parse(url);
    
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Cloud not launch: $url');
    }
  }
}
