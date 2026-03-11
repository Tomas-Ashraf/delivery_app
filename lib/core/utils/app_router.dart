import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/Home/Home.dart';
import 'package:food_delivery_app/features/onboarding_screen/presentation/onboarding_screen.dart';
import 'package:food_delivery_app/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onBoardingScreen';
  static const kHomeScreen = '/homeScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),

      //HomeScreen Route
      GoRoute(path: kHomeScreen, builder: (context, state) => HomeWidget()),
    ],
  );
}
