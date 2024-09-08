import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad_toonfilx/models/movie_detail_model.dart';
import 'package:nomad_toonfilx/services/movie_api_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;
  final String movieImgBaseURL;
  const MovieDetailScreen({
    super.key,
    required this.id,
    required this.movieImgBaseURL,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> movieDetail;

  String title = "test";

  @override
  void initState() {
    super.initState();
    movieDetail = MovieApiService.getMovieDetail(widget.id);
  }

  String getGenre(List<dynamic> genres) {
    List<String> genreNameList = [];
    for (var genre in genres) {
      genreNameList.add(genre['name']);
    }
    return genreNameList.join(", ");
  }

  String getRuntime(int runtime) {
    return "${runtime ~/ 60}h ${runtime % 60}min";
  }

  int getRating(double rating) {
    return (rating / 2).round();
  }

  onButtonTap(String homepage) async {
    if (homepage == "") {
      return;
    }
    await launchUrlString(homepage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          "Back to list",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(0, 0),
                blurRadius: 1,
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.movieImgBaseURL + snapshot.data!.poster_path,
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            Icon(
                              Icons.star_rounded,
                              color: i < getRating(snapshot.data!.vote_average)
                                  ? Colors.yellow
                                  : Colors.black54,
                              size: 30,
                            ),
                        ],
                      ),
                      Text(
                        "${getRuntime(snapshot.data!.runtime)} | ${getGenre(snapshot.data!.genres)}",
                        style: const TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Storyline",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () => onButtonTap(snapshot.data!.homepage),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Buy Ticket",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
