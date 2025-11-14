import 'package:flutter/material.dart';
import 'package:fluxstore/Auth/Widgets/costum_auth_btn.dart';
import 'package:fluxstore/Forgot_password/Widgets/costum_txt_f.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4), // (x, y)
                  spreadRadius: 0,
                ),
              ],
              shape: BoxShape.circle,
              color: Color(0xffFFFFFF),
            ),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(34),
            Text(AppStrings.ForgotPassword, style: AppStyles.semibold24),
            Gap(20),
            Text(AppStrings.forgotdesc, style: AppStyles.Regular14),
            Gap(50),
            CostumTxtF(hint: AppStrings.enteryouremailhere),
            Gap(50),
            Center(child: CostumAuthBtn(text: AppStrings.send, onPressed: () {  },)),
          ],
        ),
      ),
    );
  }
}
