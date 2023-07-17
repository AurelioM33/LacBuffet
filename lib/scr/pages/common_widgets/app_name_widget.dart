import 'package:flutter/material.dart';

import '../../config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? lacTitleColor;
  final double textsize;

  const AppNameWidget({Key? key, this.lacTitleColor, this.textsize = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textsize,
        ),
        children: [
          TextSpan(
            text: 'Lac',
            style: TextStyle(
                color: lacTitleColor ?? CustomColors.customSwatchColor),
          ),
          TextSpan(
            text: 'Buffet',
            style: TextStyle(color: CustomColors.customConstrastcolor),
          ),
        ],
      ),
    );
  }
}
