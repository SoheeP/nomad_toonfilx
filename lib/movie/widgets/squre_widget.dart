import 'package:flutter/material.dart';
import 'package:nomad_toonfilx/movie/screen/movie_detail_screen.dart';

class SquareWidget extends StatelessWidget {
  final String movieImgBaseURL, title, backdrop_path;
  final int id;
  const SquareWidget({
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
      child: Container(
        width: 150,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                width: 150,
                height: 150,
                movieImgBaseURL + backdrop_path,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
