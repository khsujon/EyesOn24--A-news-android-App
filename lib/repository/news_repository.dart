import 'dart:convert';

import 'package:eyeson24/models/news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

import '../models/categories_news_model.dart';

class NewsRepository {
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=3aaa1cdb761546b9b3de8fe7fb57abbb';

    final response = await http.get(Uri.parse(url));
    //print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Data not found');
  }

  Future<CategoriesNewsModel> fetchNewsCategoriesApi(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=${category}&apiKey=3aaa1cdb761546b9b3de8fe7fb57abbb';

    final response = await http.get(Uri.parse(url));
    //print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Data not found');
  }
}
