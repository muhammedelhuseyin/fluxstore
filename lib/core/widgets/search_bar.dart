import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.readonly, required this.ontap, required this.onPressed,
  });
  final bool readonly;
  final VoidCallback ontap;
  final VoidCallback onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: TextField(
              onTap: ontap,
              readOnly: readonly,
              decoration: InputDecoration(
                  hint: Text(
                    AppStrings.Search,
                    style: AppStyles.Regular14,
                  ),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Color(0xff777E90),
                  ),
                  filled: true,
                  fillColor: AppColors.containerbg,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent),
                  )),
            ),
          ),
        ),
        Gap(15),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 55,
            width: 52,
            decoration: BoxDecoration(
              color: AppColors.containerbg,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Image.asset(
              AppImages.descover1,
              scale: 3.7,
            ),
          ),
        ),
      ],
    );
  }
}
