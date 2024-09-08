class MovieDetailModel {
  final bool adult;
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      title,
      release_date,
      status,
      homepage;
  final List<dynamic> genres;
  final int id, runtime;
  final double vote_average;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        title = json['title'],
        release_date = json['release_date'],
        genres = json['genres'],
        id = json['id'],
        runtime = json['runtime'],
        status = json['status'],
        vote_average = json['vote_average'],
        homepage = json['homepage'];
}
