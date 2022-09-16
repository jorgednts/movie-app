import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/context_extensions.dart';
import '../common/constants/movies_constant_colors.dart';
import '../common/widgets/circular_progress_indicator_widget.dart';
import '../common/widgets/custom_error_widget.dart';
import '../common/widgets/movie_card_list_widget.dart';
import '../controller/movie_list_page_controller.dart';
import 'movie_list_page_state.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final MovieListPageController controller =
      Modular.get<MovieListPageController>();

  @override
  void initState() {
    super.initState();
    controller.getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    context.setStatusBarColor(MoviesConstantColors.darkBlue);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MoviesConstantColors.primaryColor,
        title: const Text('TMDB'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: ValueListenableBuilder<MovieListPageState>(
            valueListenable: controller,
            builder: (context, state, _) {
              switch (state) {
                case MovieListPageState.loading:
                  return const CircularProgressIndicatorWidget();
                case MovieListPageState.genericError:
                  return CustomErrorWidget(
                    errorText: 'Ocorreu um erro!',
                    onClickButton: controller.getMovieList,
                    textColor: MoviesConstantColors.secondaryColor,
                  );
                case MovieListPageState.networkError:
                  return CustomErrorWidget(
                    errorText: 'Falha na conexão!',
                    onClickButton: controller.getMovieList,
                    textColor: MoviesConstantColors.secondaryColor,
                  );
                case MovieListPageState.success:
                  return MovieCardListWidget(movieList: controller.movieList);
              }
            }),
      ),
    );
  }
}
