import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class CostumTxtF extends StatelessWidget {
  const CostumTxtF({super.key, required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        prefixIcon: Image.asset(AppImages.email_icon,scale: 2.4,),
        hint: Text(hint, style: AppStyles.Regular14),
        focusedBorder: UnderlineInputBorder(
          
          borderSide: BorderSide(color: Color(0xffD6D6D6)),
        ),
      
      ),
    );
  }
}
