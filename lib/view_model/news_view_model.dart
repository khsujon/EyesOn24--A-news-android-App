import 'package:eyeson24/models/news_channel_headlines_model.dart';
import 'package:eyeson24/repository/news_repository.dart';

class NewsViewModel {
  final _repo = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    final response = await _repo.fetchNewsChannelHeadlinesApi();
    return response;
  }
}
