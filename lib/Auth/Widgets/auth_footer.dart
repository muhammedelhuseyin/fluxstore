

import 'package:flutter/material.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key, required this.question, required this.actionText, required this.onActionPressed,
  });
  final String question;
  final String actionText;
  final VoidCallback onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          question,
          style: AppStyles.Regular14,
        ),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
           actionText,
            style: AppStyles.Regular14.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}


