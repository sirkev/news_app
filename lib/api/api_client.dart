import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NetworkService {
  //Creates an empty list of articles
  List<Articles> articles = [];

  //This method is asynchronous, hence the async keyword used, meaning the application can make the network request and continue performing other tasks. When there is a response, then the application acts on the data.
  Future<List<Articles>> getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //Retrieves the response from the http response body
      final data = jsonDecode(response.body);
      //Loops through the news list JSON converting each news item to Article model and adding to articles list we defined above.
      articles = (data["articles"] as List)
          .map((json) => Articles.fromJson(json))
          .toList();
    } else {
      //This section of the code is executed if the network request fails, i.e. due to unavailable network or incorrect URL.
      print("Error in URL");
    }
    return articles;
  }
}