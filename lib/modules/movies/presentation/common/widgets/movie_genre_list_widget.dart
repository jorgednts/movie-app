import 'package:flutter/material.dart';

import '../constants/movies_constant_colors.dart';

class MovieGenreListWidget extends StatelessWidget {
  const MovieGenreListWidget({
    required this.genres,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final List<String> genres;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            genres.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Chip(
                padding: EdgeInsets.zero,
                side: const BorderSide(
                  color: MoviesConstantColors.lightBlue,
                ),
                label: Text(
                  genres[index],
                  style: const TextStyle(
                    color: MoviesConstantColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                backgroundColor: backgroundColor,
              ),
            ),
          ),
        ),
      );
}
