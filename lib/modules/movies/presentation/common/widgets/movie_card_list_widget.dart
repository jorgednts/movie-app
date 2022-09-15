import 'package:flutter/material.dart';

import '../../../domain/model/movie/movie_model.dart';
import 'movie_card_widget.dart';

class MovieCardListWidget extends StatelessWidget {
  const MovieCardListWidget({
    required this.movieList,
    Key? key,
  }) : super(key: key);

  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) =>
          MovieCardWidget(movie: movieList[index]));
}
