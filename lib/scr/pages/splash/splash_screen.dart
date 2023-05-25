import 'package:flutter/material.dart';
import 'package:lac_buffet/scr/pages/common_widgets/app_name_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey,
              Colors.black,
              Colors.grey.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppNameWidget(
              lacTitleColor: Colors.white,
              textsize: 40,
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
