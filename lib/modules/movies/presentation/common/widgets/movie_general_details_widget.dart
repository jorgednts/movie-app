import 'package:flutter/material.dart';

import '../../../domain/model/details/movie_details_model.dart';
import '../../../utils/string_extensions.dart';
import '../constants/movies_constant_colors.dart';

class MovieGeneralDetailsWidget extends StatelessWidget {
  const MovieGeneralDetailsWidget({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final MovieDetailsModel movie;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Título original:',
              style: TextStyle(
                color: MoviesConstantColors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: movie.originalTitle,
                          style: const TextStyle(
                            color: MoviesConstantColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const TextSpan(text: '   '),
                        TextSpan(
                          text: '(${movie.originalLanguage.toUpperCase()})',
                          style: const TextStyle(
                            color: MoviesConstantColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  movie.releaseDate.convertDateToLocaleBr(),
                  style: const TextStyle(
                    color: MoviesConstantColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                //if (controller.movie!.adult)
                const Text(
                  'NSFW',
                  style: TextStyle(
                    color: MoviesConstantColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${movie.runtime.toString()} min.',
                  style: const TextStyle(
                    color: MoviesConstantColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
