import 'package:flutter/material.dart';
import 'package:fluxstore/Auth/Widgets/auth_footer.dart';
import 'package:fluxstore/Auth/Widgets/costum_auth_btn.dart';
import 'package:fluxstore/Auth/Widgets/costum_text_field.dart';
import 'package:fluxstore/Auth/Widgets/social_media_icons.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LpgInScreenState();
}

class _LpgInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(95),
            Text(AppStrings.logintitle,style: AppStyles.semibold24,),
            Gap(48),
            CostumTextField(hint: AppStrings.emailaddress,),
            Gap(20),
            CostumTextField(hint: AppStrings.password,),
            Gap(28),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("forgot"),
              child: Align(
                alignment:Alignment.centerRight ,
                child: Text(AppStrings.ForgotPassword,style: AppStyles.Regular12,),
              ),
            ),
            Gap(25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CostumAuthBtn(text:AppStrings.login, onPressed: () {  
                  context.push("/home");
                }, ),
                Gap(20),
                Text(AppStrings.orloginwith,style: AppStyles.Regular12,),
                Gap(30),
                SocialMediaIcons(),
                Gap(109),
                AuthFooter(question: AppStrings.Donthaveanaccount,
                 actionText:"Sign Up" ,
                  onActionPressed: (){
                   context.push("/signup");
                  }
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}