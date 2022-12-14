import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article.dart';
import '../stores/news_store.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Initializes the NewsStore state manager class
  NewsStore newsStore = NewsStore();
  List<Articles> articles = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }
  //Call the fetchArticle() method from the newsStore state manager class, the getData() method from the network service class is called to make network request.
  getNews() async {
    await newsStore.fetchArticle();
    //When the newStore articles list has data the the data is retrieved and add to the articles list in this screen.
    articles.addAll(newsStore.articles);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('News'),
    ),
    //The Observer widgets checks if the state of the observable variable changed and renders a widget conditionally.
    body: Observer(
      //A list of news items shows if the observable variable has data or a progress indicator is shown.
        builder: (_) => (articles.isNotEmpty)
            ? ListView.builder(
          itemCount: articles.length,
          itemBuilder: (_, index) {
            final newsArticles = articles[index];
            return ArticleContainer(newsArticles);
          },
        )
            : const Center(
          child: CircularProgressIndicator(),
        )),
  );

  Widget ArticleContainer(Articles newsArticle) {
    return Padding(
      key: Key(newsArticle.title!),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          newsArticle.title!,
          style: const TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${newsArticle.author} comments"),
              IconButton(
                onPressed: () async {
                  if (await canLaunch(newsArticle.url!)) {
                    launch(newsArticle.url!);
                  }
                },
                icon: const Icon(Icons.launch),
              )
            ],
          ),
        ],
      ),
    );
  }
}