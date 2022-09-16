import 'package:flutter/material.dart';

import '../../../domain/model/details/movie_details_model.dart';
import '../constants/movies_constant_colors.dart';
import 'movie_genre_list_widget.dart';
import 'movie_poster_widget.dart';

class MovieDescriptionWidget extends StatelessWidget {
  const MovieDescriptionWidget({
    required this.movieDetails,
    Key? key,
  }) : super(key: key);

  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) => Container(
        color: MoviesConstantColors.primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                MoviePosterWidget(posterUrl: movieDetails.posterUrl),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: [
                      MovieGenreListWidget(
                        genres: movieDetails.genres,
                        backgroundColor: MoviesConstantColors.primaryColor,
                      ),
                      Text(
                        movieDetails.overview,
                        style: const TextStyle(
                          fontSize: 13,
                          color: MoviesConstantColors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 3),
            const Divider(
              color: MoviesConstantColors.lightBlue,
              thickness: 1,
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.star,
                        color: MoviesConstantColors.gold,
                        size: 25,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${movieDetails.voteAverage.toStringAsFixed(1)}/10',
                        style: const TextStyle(
                          color: MoviesConstantColors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Status:',
                        style: TextStyle(
                          color: MoviesConstantColors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        movieDetails.status,
                        style: const TextStyle(
                          color: MoviesConstantColors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8)
          ],
        ),
      );
}
