
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/provider/news_view_model_provider.dart';

class NewsWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(newsViewModelNotifierProvider);

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: ListView(
            children: [
              _menuItem('サンプル1', Icon(Icons.abc_sharp)),
              _menuItem('サンプル2', Icon(Icons.abc_sharp)),
              _menuItem('サンプル3', Icon(Icons.abc_sharp)),
              _menuItem('サンプル4', Icon(Icons.abc_sharp)),
              _menuItem('サンプル5', Icon(Icons.abc_sharp)),
              _menuItem('サンプル6', Icon(Icons.abc_sharp)),
              _menuItem('サンプル7', Icon(Icons.abc_sharp)),
              _menuItem('サンプル8', Icon(Icons.abc_sharp)),
              _menuItem('サンプル9', Icon(Icons.abc_sharp)),
              _menuItem('サンプル10', Icon(Icons.abc_sharp)),
              _menuItem('サンプル11', Icon(Icons.abc_sharp)),
              _menuItem('サンプル12', Icon(Icons.abc_sharp)),
              _menuItem('サンプル13', Icon(Icons.abc_sharp)),
              _menuItem('サンプル14', Icon(Icons.abc_sharp)),
              _menuItem('サンプル15', Icon(Icons.abc_sharp))
            ],
        )
      ),
    );
  }
  
  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child:Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child:icon,
              ),
              Text(
                title,
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],
          )
      ),
      onTap: () {
        print("onTap called.");
      },
    );
  }
}