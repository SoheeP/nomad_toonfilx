class MovieModel {
  final bool adult;
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      title,
      release_date;
  final List<int> genre_ids;
  final int id;
  final double vote_average;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        title = json['title'],
        release_date = json['release_date'],
        genre_ids = json['genre_ids'].cast<int>(),
        id = json['id'],
        vote_average = json['vote_average'];
}
