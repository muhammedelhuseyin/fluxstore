import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/found_results.dart';

import 'package:fluxstore/core/router/app_router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router
    (
     // home: FoundResults(),
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color(0xffFFFFFF), // 👈 لون الخلفية لكل الصفحات
        // باقي الإعدادات...
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffFFFFFF),
           surfaceTintColor: Color(0xffFFFFFF),
          elevation: 0,
        ),
      ),
      ///  ✅ ربط الراوتر
    routerConfig: AppRouter.router,

      debugShowCheckedModeBanner: false,
    );
  }
}