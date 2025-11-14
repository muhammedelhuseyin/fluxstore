import 'package:fluxstore/core/helper/app_images.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;

  OnboardingModel({required this.title, required this.subtitle, required this.image});




static final List <OnboardingModel> page =[
  OnboardingModel(
    title:'Discover something new',
   subtitle:'Special new arrivals just for you',
   image:AppImages.onboarding1,
    
  ),
  OnboardingModel(
    title:'Update trendy outfit',
   subtitle:'Favorite brands and hottest trends',
   image:AppImages.onboarding2,
    
  ),
  OnboardingModel(
    title:'Explore your true styl',
   subtitle:'Relax and let us bring the style to you',
   image:AppImages.onboarding3,
    
  )
];

}