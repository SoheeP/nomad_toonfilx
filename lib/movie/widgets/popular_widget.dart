import 'package:flutter/material.dart';
import 'package:nomad_toonfilx/movie/screen/movie_detail_screen.dart';

class PopularWidget extends StatelessWidget {
  final String movieImgBaseURL, title, backdrop_path;
  final int id;
  const PopularWidget({
    super.key,
    required this.movieImgBaseURL,
    required this.title,
    required this.backdrop_path,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                id: id,
                movieImgBaseURL: movieImgBaseURL,
              ),
            ));
      },
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              movieImgBaseURL + backdrop_path,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
