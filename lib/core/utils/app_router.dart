import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/History_Feature/historyScreen.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/Home/Home.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/auth_screen.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/reset_password_screen.dart';
import 'package:food_delivery_app/features/onboarding_screen/presentation/onboarding_screen.dart';
import 'package:food_delivery_app/features/orders_Feature/OrdersScreen.dart';
import 'package:food_delivery_app/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onBoardingScreen';
  static const kHomeScreen = '/homeScreen';
  static const kAuthScreen = '/authScreen';
  //static const kHomeScreen = '/homeScreen';
  static const kResetScreen = '/resetPasswordScreen';

  //routers of orders and history screens
  static const kOrdersScreen = '/ordersScreen';
  static const kHistoryScreen = '/historyScreen';

  static final router = GoRouter(
    routes: [
      //routes of splash and onboarding screens
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),

      //routes of auth operation screens
      GoRoute(path: kAuthScreen, builder: (context, state) => AuthScreen()),

      GoRoute(
        path: kResetScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ResetPasswordScreen(),
        ),
      ),

      //routes of Home operation screens
      GoRoute(path: kHomeScreen, builder: (context, state) => HomeWidget()),
      GoRoute(path: kOrdersScreen, builder: (context, state) => OrdersScreen()),
      GoRoute(
        path: kHistoryScreen,
        builder: (context, state) => HistoryScreen(),
      ),
    ],
  );
}
