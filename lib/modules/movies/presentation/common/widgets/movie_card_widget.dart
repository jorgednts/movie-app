import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants/movies_constant_routes.dart';
import '../../../domain/model/movie/movie_model.dart';
import '../../../utils/string_extensions.dart';
import '../constants/movies_constant_colors.dart';
import 'movie_genre_list_widget.dart';
import 'movie_poster_widget.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: MoviesConstantColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey,
              offset: Offset(3, 3),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MoviePosterWidget(posterUrl: movie.posterUrl),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const SizedBox(height: 5),
                  Text(
                    movie.title,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MoviesConstantColors.white,
                    ),
                  ),
                  //const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: MoviesConstantColors.gold,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          color: MoviesConstantColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 8),
                  MovieGenreListWidget(
                    genres: movie.genres,
                    backgroundColor: MoviesConstantColors.secondaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Lançamento:',
                        style: TextStyle(
                          color: MoviesConstantColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          movie.releaseDate.convertDateToLocaleBr(),
                          style: const TextStyle(
                            color: MoviesConstantColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Modular.to.pushNamed(
                        MoviesConstantsRoutes.movieDetailsPage,
                        arguments: movie.id,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MoviesConstantColors.pink,
                        minimumSize: const Size(0, 0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                      ),
                      child: const Text(
                        'Ver Mais',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
