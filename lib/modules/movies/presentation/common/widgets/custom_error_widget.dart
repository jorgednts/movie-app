import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../constants/movies_constant_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.errorText,
    required this.onClickButton,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  final String errorText;
  final Function() onClickButton;
  final Color textColor;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: onClickButton,
              style: ElevatedButton.styleFrom(
                primary: MoviesConstantColors.pink,
                minimumSize: const Size(0, 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
              ),
              child: Text(
                S.of(context).tryAgain,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      );
}
