

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nt_news/src/data/models/most_popular_article_module.dart';

class MostPopularArticleDetailsPage extends StatefulWidget{
  const MostPopularArticleDetailsPage({Key? key, required this.article}) : super(key: key);
  final Results article;

  @override
  _MostPopularArticleDetailsPageState createState()=> _MostPopularArticleDetailsPageState(article);
}

class _MostPopularArticleDetailsPageState extends State<MostPopularArticleDetailsPage> {

  Results article;
  _MostPopularArticleDetailsPageState(this.article);
  var imgURL = "";

  @override
  void initState() {
    if (article.media != null) {
      for(var media in article.media!) {
        if (media.mediametadata != null) {
          for(var mediaMeta in media.mediametadata!) {
            imgURL = mediaMeta.url ?? "";
          }
        }
      }
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // loadAppointments("&start_index=0&limit=100&today=1");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: _body()
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Article Details', style: TextStyle(color: Colors.white)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              // child: Container(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              article.title!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AspectRatio(
                aspectRatio: 1,
                child:
                Image.network(
                  imgURL,
                  fit: BoxFit.cover,
                )
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Spacer(),
                Text(
                    article.publishedDate!,
                    style: const TextStyle(color: Colors.grey)
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              article.abstract!,
            ),
            const SizedBox(height: 5),
            Text(article.byline!,
              maxLines: 2,
              style: const TextStyle(color: Colors.grey),
            ),

          ],
        ),
      ),
    );
  }
}