import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.assetPath,
    required this.size,
    this.onPressed,
    required this.color,
  });

  final String assetPath;
  final double size;
  final void Function()? onPressed;
  final int color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: this.onPressed,
        child: SvgPicture.asset(
          assetPath,
          color: Color(color),
        ),
      ),
    );
  }
}
