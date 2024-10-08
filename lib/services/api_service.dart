import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nomad_toonfilx/models/webtoon_detail_model.dart';
import 'package:nomad_toonfilx/models/webtoon_episode_model.dart';
import 'package:nomad_toonfilx/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

// 내부 await 키워드를 사용하기 때문에 리턴값도 Future로 설정
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final uri = Uri.parse('$baseUrl/$today');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final uri = Uri.parse('$baseUrl/$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final uri = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
