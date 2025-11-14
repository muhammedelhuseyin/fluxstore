import 'package:flutter/material.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class CostumTextField extends StatelessWidget {
  const CostumTextField({super.key, required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hint: Text(hint, style: AppStyles.Regular14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD6D6D6)),
        ),
      ),
    );
  }
}
