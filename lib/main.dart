import 'package:flutter/material.dart';

import 'modules/movies/presentation/common/constants/movies_constant_colors.dart';
import 'modules/movies/presentation/common/constants/movies_constant_fonts.dart';
import 'modules/movies/presentation/page/movie_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: MoviesConstantColors.primaryColor,
          fontFamily: MoviesConstantFonts.fredoka,
        ),
        home: const MovieListPage(),
      );
}
