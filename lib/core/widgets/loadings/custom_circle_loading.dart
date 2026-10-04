import 'package:flutter/material.dart';

enum LoadingSize { small, medium, large }

class CustomCircleLoading extends StatelessWidget {
  final LoadingSize? size;
  final Color? color;

  const CustomCircleLoading({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    double loadingSize = 16;
    double loadingWidth = 3;

    switch (size!) {
      case LoadingSize.small:
        loadingSize = 16;
        loadingWidth = 2;
        break;
      case LoadingSize.medium:
        loadingSize = 24;
        loadingWidth = 3;
        break;
      case LoadingSize.large:
        loadingSize = 32;
        loadingWidth = 4;
        break;
    }

    return SizedBox(
      width: loadingSize,
      height: loadingSize,
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
        strokeWidth: loadingWidth,
      ),
    );
  }
}
