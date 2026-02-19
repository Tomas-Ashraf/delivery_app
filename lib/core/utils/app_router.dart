import 'package:food_delivery_app/features/auth_screen/presentation/auth_screen.dart';
import 'package:food_delivery_app/features/onboarding_screen/presentation/onboarding_screen.dart';
import 'package:food_delivery_app/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onBoardingScreen';
  static const kAuthScreen = '/authScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(path: kAuthScreen, builder: (context, state) => AuthScreen()),
    ],
  );
}
