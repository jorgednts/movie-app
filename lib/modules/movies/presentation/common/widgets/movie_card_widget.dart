import 'package:flutter/material.dart';

import '../../../constants/movies_constant_images.dart';
import '../../../domain/model/movie/movie_model.dart';
import '../constants/movies_constant_colors.dart';

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
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 8,
                right: 8,
                bottom: 8,
              ),
              child: FadeInImage(
                width: 100,
                height: 180,
                placeholderFit: BoxFit.scaleDown,
                image: NetworkImage(movie.posterUrl),
                placeholder:
                    const AssetImage(MoviesConstantsImages.loadingImage),
                imageErrorBuilder: (content, error, stackTrace) => Image.asset(
                  MoviesConstantsImages.errorImage,
                  width: 100,
                  height: 180,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    movie.title,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MoviesConstantColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 8),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        movie.genres.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Chip(
                            padding: EdgeInsets.zero,
                            label: Text(
                              movie.genres[index],
                              style: const TextStyle(
                                color: MoviesConstantColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: MoviesConstantColors.lightBlue,
                          ),
                        ),
                      ),
                    ),
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
                          movie.releaseDate,
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
                      onPressed: () {},
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
