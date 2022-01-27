
import 'dart:async';

import 'package:nt_news/src/data/datasources/remote/http_parser.dart';
import 'package:nt_news/src/data/models/most_popular_article_module.dart';

import '../../../Injector.dart';

enum ArticleAction {
  fetch,
  delete
}
class MostPopularArticleBloc {
  final _stateStreamConroller = StreamController<List<Results>>();
  StreamSink<List<Results>> get _articleSink => _stateStreamConroller.sink;
  Stream<List<Results>> get articleStream => _stateStreamConroller.stream;

  final _eventStreamConroller = StreamController<ArticleAction>();
  StreamSink<ArticleAction> get eventSink => _eventStreamConroller.sink;
  Stream<ArticleAction> get _eventStream => _eventStreamConroller.stream;

  MostPopularArticleBloc() {
    _eventStream.listen((event) {
      if(event == ArticleAction.fetch) {
        injector.get<HttpParser>().getMostPopular(success: (mostPopular) async {
          _articleSink.add(mostPopular.results);
        }, failure: (errorMessage) async {
          _articleSink.addError(errorMessage);
        });
      }
    });
  }

  void dispose() {
    _stateStreamConroller.close();
    _eventStreamConroller.close();
  }

}