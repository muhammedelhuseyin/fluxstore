import 'package:fluxstore/Discover/Models/product_models.dart';
import 'package:fluxstore/Discover/found_results.dart';
import 'package:fluxstore/Discover/search_screen.dart';
import 'package:fluxstore/Onboarding/onboarding_screen.dart';
import 'package:fluxstore/home/models/products_model.dart';
import 'package:fluxstore/layout/main_layout.dart';
import 'package:fluxstore/product/product_datelis.dart';
import 'package:go_router/go_router.dart';

// 🧩 استيراد الصفحات
import 'package:fluxstore/splash/splash_screen.dart';
import 'package:fluxstore/Auth/LogİN/log_in_screen.dart';
import 'package:fluxstore/Auth/SginUp/sign_up_screen.dart';
import 'package:fluxstore/Forgot_password/forgot_password_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/', // المسار الأول عند فتح التطبيق
    routes: [
      GoRoute(
        path: '/', // 🔹 البداية (Splash)
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/forgot',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/FoundResults',
        builder: (context, state) => const FoundResults(),
      ),
      GoRoute(
        path: '/onbording',
        builder: (context, state) =>  OnboardingScreen(),
      ),
      GoRoute(
  path: '/productDetails',
  name: 'productDetails',
  builder: (context, state) {
    final product = state.extra as ProductsModel;
    return ProductDatelis(product: product);
  },
),


    ],
  );
}
