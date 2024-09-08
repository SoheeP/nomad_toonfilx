import 'dart:convert';

import 'package:nomad_toonfilx/models/movie_detail_model.dart';
import 'package:nomad_toonfilx/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String nowPlaying = 'now-playing';
  static const String comingSoon = 'coming-soon';

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final uri = Uri.parse('$baseUrl/$popular');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final dynamic popularMovie = jsonDecode(response.body);
      final List<dynamic> results = popularMovie['results'];
      for (var movie in results) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMovies() async {
    List<MovieModel> movieInstances = [];
    final uri = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final dynamic popularMovie = jsonDecode(response.body);
      final List<dynamic> results = popularMovie['results'];
      for (var movie in results) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoon() async {
    List<MovieModel> movieInstances = [];
    final uri = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final dynamic popularMovie = jsonDecode(response.body);
      final List<dynamic> results = popularMovie['results'];
      for (var movie in results) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieDetail(int id) async {
    final uri = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> detail = jsonDecode(response.body);
      return MovieDetailModel.fromJson(detail);
    }
    throw Error();
  }
}
