import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../common/constants/movies_constant_colors.dart';
import '../common/widgets/circular_progress_indicator_widget.dart';
import '../common/widgets/movie_additional_details_widget.dart';
import '../common/widgets/movie_description_widget.dart';
import '../common/widgets/movie_general_details_widget.dart';
import '../controller/movie_details_page_controller.dart';
import 'movie_details_page_state.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final int id;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsPageController controller =
      Modular.get<MovieDetailsPageController>();

  @override
  void initState() {
    super.initState();
    controller.getMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: MoviesConstantColors.primaryColor,
          title: ValueListenableBuilder<MovieDetailsPageState>(
            valueListenable: controller,
            builder: (context, state, _) {
              switch (state) {
                case MovieDetailsPageState.loading:
                  return const Text('Carregando...');
                case MovieDetailsPageState.genericError:
                  return const Text('');
                case MovieDetailsPageState.networkError:
                  return const Text('');
                case MovieDetailsPageState.success:
                  return Text(controller.movie!.title);
              }
            },
          ),
        ),
        backgroundColor: MoviesConstantColors.darkBlue,
        body: ValueListenableBuilder<MovieDetailsPageState>(
          valueListenable: controller,
          builder: (context, state, _) {
            switch (state) {
              case MovieDetailsPageState.loading:
                return const CircularProgressIndicatorWidget();
              case MovieDetailsPageState.genericError:
                return const Text('Erro');
              case MovieDetailsPageState.networkError:
                return const Text('Erro de Internet');
              case MovieDetailsPageState.success:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      MovieGeneralDetailsWidget(
                        movieDetails: controller.movie!,
                      ),
                      const SizedBox(height: 10),
                      MovieDescriptionWidget(movieDetails: controller.movie!),
                      const SizedBox(height: 20),
                      MovieAdditionalDetailsWidget(
                        movieDetails: controller.movie!,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
            }
          },
        ),
      );
}
