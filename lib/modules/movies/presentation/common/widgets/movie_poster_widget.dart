import 'package:flutter/material.dart';

import '../../../constants/movies_constant_images.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({
    required this.posterUrl,
    Key? key,
  }) : super(key: key);

  final String posterUrl;

  @override
  Widget build(BuildContext context) => Padding(
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
          image: NetworkImage(posterUrl),
          placeholder: const AssetImage(MoviesConstantsImages.loadingImage),
          imageErrorBuilder: (content, error, stackTrace) => Image.asset(
            MoviesConstantsImages.errorImage,
            width: 100,
            height: 180,
            alignment: Alignment.center,
          ),
        ),
      );
}
