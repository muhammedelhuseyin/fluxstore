import 'package:flutter/material.dart';
import 'package:fluxstore/Auth/Widgets/auth_footer.dart';
import 'package:fluxstore/Auth/Widgets/costum_auth_btn.dart';
import 'package:fluxstore/Auth/Widgets/costum_text_field.dart';
import 'package:fluxstore/Auth/Widgets/social_media_icons.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //هنا انا وضعت padding من اجل وضع مسافة عامودية للكولم اريد هنا لان العناصر تبدا من البداية
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(95),
            Text(AppStrings.signuptitle, style: AppStyles.semibold24),
            Gap(20),
            CostumTextField(hint: AppStrings.signuotext1),
            Gap(20),
            CostumTextField(hint: AppStrings.emailaddress),
            Gap(20),
            CostumTextField(hint: AppStrings.password),
            Gap(20),
            CostumTextField(hint: AppStrings.signuotext4),
            Gap(36),
            // من هنا الى اخر الصفحة اريد العناصر بالمنصف
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CostumAuthBtn(text: AppStrings.signup, onPressed: () {  },),
                Gap(28),
                Text(AppStrings.orsignupwith, style: AppStyles.Regular14),
                Gap(30),
                SocialMediaIcons(),
                Gap(28),
                AuthFooter(question: AppStrings.Alreadyhaveaccount,
                 actionText: 'Log in',
                 onActionPressed: () {  
                  context.push("/login");
                 },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


