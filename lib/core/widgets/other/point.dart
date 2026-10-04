import 'package:flutter/material.dart';

class Point extends StatelessWidget {
  final double size;
  final Color color;
  const new({super.key, this.size = 16, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
