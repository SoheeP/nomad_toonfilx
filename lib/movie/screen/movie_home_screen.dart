import 'package:flutter/material.dart';
import 'package:nomad_toonfilx/models/movie_model.dart';
import 'package:nomad_toonfilx/movie/widgets/popular_widget.dart';
import 'package:nomad_toonfilx/movie/widgets/squre_widget.dart';
import 'package:nomad_toonfilx/services/movie_api_service.dart';

class MovieHomeScreen extends StatelessWidget {
  MovieHomeScreen({super.key});
  String movieImgBaseURL = 'https://image.tmdb.org/t/p/w500/';

  final Future<List<MovieModel>> popularMovies =
      MovieApiService.getPopularMovies();

  final Future<List<MovieModel>> nowMovies = MovieApiService.getNowMovies();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 80,
          ),
          child: allPageList(),
        ),
      ),
    );
  }

  ListView makePopularMovie(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          var movie = snapshot.data![index];
          return PopularWidget(
            id: movie.id,
            movieImgBaseURL: movieImgBaseURL,
            title: movie.title,
            backdrop_path: movie.backdrop_path,
          );
        });
  }

  ListView squareMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          var movie = snapshot.data![index];
          return SquareWidget(
            id: movie.id,
            movieImgBaseURL: movieImgBaseURL,
            title: movie.title,
            backdrop_path: movie.backdrop_path,
          );
        });
  }

  ListView allPageList() {
    return ListView(
      children: [
        SizedBox(
          height: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Popular Movies",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(child: makePopularMovie(snapshot));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Now in Cinemas",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: squareMovieList(snapshot),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Comming Soon",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: squareMovieList(snapshot),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/**
 *
 *Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Text(
                  "Popular Movies",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: makePopularMovie(snapshot),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Now in Cinemas",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: squareMovieList(snapshot),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Comming Soon",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: squareMovieList(snapshot),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
 */