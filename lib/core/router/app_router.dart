import 'package:fluxstore/Discover/search_screen.dart';
import 'package:fluxstore/Onboarding/onboarding_screen.dart';
import 'package:fluxstore/layout/main_layout.dart';
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
        path: '/onbording',
        builder: (context, state) =>  OnboardingScreen(),
      ),
    ],
  );
}
