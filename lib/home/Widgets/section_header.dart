
import 'package:flutter/material.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class SectionHeader extends StatelessWidget {
final String Title;
final String actionText;
final VoidCallback? ontap;


  const SectionHeader({
    super.key, required this.Title, required this.actionText, this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Title, style: AppStyles.semibold20),
        GestureDetector(
          onTap: ontap,
          child: Text(actionText, style: AppStyles.Regular13)),
      ],
    );
  }
}
