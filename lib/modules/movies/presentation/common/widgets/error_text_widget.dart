import 'package:flutter/material.dart';
import '../constants/movies_constant_colors.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    required this.errorText,
    Key? key,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Text(
          errorText,
          style: const TextStyle(
            color: MoviesConstantColors.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      );
}
