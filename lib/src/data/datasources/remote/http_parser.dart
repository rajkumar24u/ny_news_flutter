import 'package:nt_news/src/core/utils/api.dart';
import 'package:nt_news/src/data/models/most_popular_article_module.dart';

import 'http_request.dart';

class HttpParser  {

 void getMostPopular({ success: (MostPopularArticleModule), failure: (String)}) async {
    final api = API.most_popular;
    await HTTP.get(api: api, success: (jsonData) {
      var mostPopular = MostPopularArticleModule();
      mostPopular.fromJson(jsonData);
      success(mostPopular);
    }, failure: failure);
  }

}