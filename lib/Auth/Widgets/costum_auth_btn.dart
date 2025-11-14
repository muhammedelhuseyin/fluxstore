import 'package:flutter/material.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class CostumAuthBtn extends StatelessWidget {
  const CostumAuthBtn({
    super.key, required this.text, required this.onPressed,

  });
final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(145, 51),
        backgroundColor: AppColors.scandry,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.semibold16.copyWith(color: Colors.white),
      ),
    );
  }
}
