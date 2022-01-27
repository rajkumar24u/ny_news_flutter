import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nt_news/src/data/models/most_popular_article_module.dart';
import 'package:nt_news/src/presentation/pages/most_popular_article.dart';
import 'package:nt_news/src/presentation/pages/most_popular_article_page_details.dart';

const mostPopularArticle = "/most_popular_article";
const mostPopularArticleDetails = "/most_popular_article_details";



class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case mostPopularArticle:
        return MaterialPageRoute(builder: (_) => const MostPopularArticlePage());
      case mostPopularArticleDetails:
        return MaterialPageRoute(builder: (_) =>  MostPopularArticleDetailsPage(article: settings.arguments as Results));
    }
  }
}
