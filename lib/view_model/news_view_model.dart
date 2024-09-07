import 'package:eyeson24/models/categories_news_model.dart';
import 'package:eyeson24/models/news_channel_headlines_model.dart';
import 'package:eyeson24/repository/news_repository.dart';

class NewsViewModel {
  final _repo = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    final response = await _repo.fetchNewsChannelHeadlinesApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchNewsCategoriesApi(String category) async {
    final response = await _repo.fetchNewsCategoriesApi(category);
    return response;
  }
}
