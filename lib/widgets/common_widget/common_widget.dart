import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  final Widget child;

  const CommonWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
      ],
    );
  }
}
