

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nt_news/src/config/routes/app_routes.dart';
import 'package:nt_news/src/data/datasources/remote/http_parser.dart';
import 'package:nt_news/src/data/models/most_popular_article_module.dart';
import 'package:nt_news/src/presentation/blocs/most_popular_article_bloc.dart';

class MostPopularArticlePage extends StatefulWidget{
  const MostPopularArticlePage({Key? key}) : super(key: key);

  @override
  MostPopularArticlePageState createState()=> MostPopularArticlePageState();
}

class MostPopularArticlePageState extends State<MostPopularArticlePage> {
  final _articleBloc = MostPopularArticleBloc();

  @override
  void initState() {
    super.initState();
    _articleBloc.eventSink.add(ArticleAction.fetch);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _articleBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('NY Most Popular', style: TextStyle(color: Colors.white)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return  StreamBuilder<List<Results>>(
      stream: _articleBloc.articleStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
          child: Text("Something went wrong"),
        );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];
                return GestureDetector(
                  child:  Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: _listCell(article)
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, mostPopularArticleDetails, arguments: article);                  }
                );
              });
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }


  Widget _listCell( Results article ) {
    return Row(
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: AspectRatio(
              aspectRatio: 1,
              child:
              Image.network(
                article.media!.isNotEmpty ? article.media!.first.mediametadata!.first.url! : "",
                fit: BoxFit.cover,
              )
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                article.title!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                article.abstract!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(article.byline!),
            ],
          ),
        ),
      ],
    );
  }
}