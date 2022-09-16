import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/model/details/movie_details_model.dart';
import '../constants/movies_constant_colors.dart';

class MovieAdditionalDetailsWidget extends StatelessWidget {
  const MovieAdditionalDetailsWidget({
    required this.movieDetails,
    Key? key,
  }) : super(key: key);

  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) => Container(
        color: MoviesConstantColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 15),
                Icon(
                  Icons.more_vert_rounded,
                  color: MoviesConstantColors.lightBlue,
                  size: 18,
                ),
                Expanded(
                  child: Text(
                    'MAIS INFORMAÇÕES:',
                    style: TextStyle(
                      color: MoviesConstantColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Produtoras:',
                style: TextStyle(
                  color: MoviesConstantColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 40),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  movieDetails.productionCompanies.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: MoviesConstantColors.primaryColor,
                      border: Border.all(
                        color: MoviesConstantColors.lightBlue,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          movieDetails.productionCompanies[index].name,
                          style: const TextStyle(
                            color: MoviesConstantColors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          movieDetails.productionCompanies[index].originCountry
                              .toUpperCase(),
                          style: const TextStyle(
                            color: MoviesConstantColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 30),
                const Text(
                  'Receita:',
                  style: TextStyle(
                    color: MoviesConstantColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    NumberFormat.simpleCurrency().format(movieDetails.revenue),
                    style: const TextStyle(
                      color: MoviesConstantColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Disponível em: ',
                style: TextStyle(
                  color: MoviesConstantColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 30,
              padding: const EdgeInsets.only(left: 40),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  movieDetails.spokenLanguages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      movieDetails.spokenLanguages[index],
                      style: const TextStyle(
                        color: MoviesConstantColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
