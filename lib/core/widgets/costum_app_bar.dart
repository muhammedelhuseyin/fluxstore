
import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';

class CostumAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CostumAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Image.asset(AppImages.menu_icon,scale: 4,),
      title: Text(AppStrings.hometitle,style: AppStyles.semibold20,),
      actions: [
        Stack(
          children: [
            Image.asset(AppImages.notifi_icon,scale: 4,),
            Positioned(
              right: 0,
              top: 1,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Color(0xffEF466F),
              ),
            )
          ],
          
        ),
        Gap(20),
      ],
    );
  }
    @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}