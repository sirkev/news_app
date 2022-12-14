import 'package:mobx/mobx.dart';
import '../api/api_client.dart';
import '../models/article.dart';

part 'news_store.g.dart';

class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  //Creates an instance of the network service class (api client instance)
  final NetworkService httpClient = NetworkService();

  @observable
  List<Articles> articles = [];

  @action
  Future<List<Articles>> fetchArticle() async {
    await httpClient
        .getData(
            'https://newsapi.org/v2/everything?q=bitcoin&apiKey=1bfba80a852a4a36b61239f758f97cb5')
        .then((articleList) {
      articles.addAll(articleList);
    });
    return articles;
  }

  void getTheArticles() {
    fetchArticle();
  }
}
