import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/strings.dart';

class SplashLoading extends StatelessWidget {
  final String title;

  const SplashLoading({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Strings.APP_NAME),
    );
  }
}
