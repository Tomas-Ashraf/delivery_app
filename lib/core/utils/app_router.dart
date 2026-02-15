import 'package:food_delivery_app/features/onboarding_screen/presentation/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => OnboardingScreen()),
    ],
  );
}
