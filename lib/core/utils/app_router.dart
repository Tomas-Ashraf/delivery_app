import 'package:food_delivery_app/features/History_Feature/historyScreen.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/home_screen.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/auth_screen.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/reset_password_screen.dart';
import 'package:food_delivery_app/features/onboarding_screen/presentation/onboarding_screen.dart';
import 'package:food_delivery_app/features/orders_Feature/OrdersScreen.dart';
import 'package:food_delivery_app/features/payment_screen/presentation/payment_screen.dart';
import 'package:food_delivery_app/features/receipt_screen.dart/data/receipt_model.dart';
import 'package:food_delivery_app/features/receipt_screen.dart/presentation/receipt_screen.dart';
import 'package:food_delivery_app/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onBoardingScreen';
  static const kHomeScreen = '/homeScreen';
  static const kAuthScreen = '/authScreen';
  static const kResetScreen = '/resetPasswordScreen';

  static const kOrdersScreen = '/ordersScreen';
  static const kHistoryScreen = '/historyScreen';
  static const kPaymentScreen = '/paymentScreen';
  static const kReceiptScreen = '/receiptScreen';


  static final router = GoRouter(
    routes: [
      //routes of splash and onboarding screens
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(path: kAuthScreen, builder: (context, state) => AuthScreen()),

      GoRoute(
        path: kResetScreen,
        builder: (context, state) => ResetPasswordScreen(),
      ),

      GoRoute(path: kHomeScreen, builder: (context, state) => HomeScreen()),
      GoRoute(path: kOrdersScreen, builder: (context, state) => OrdersScreen()),
      GoRoute(
        path: kHistoryScreen,
        builder: (context, state) => HistoryScreen(),
      ),
      GoRoute(
        path: kPaymentScreen,
        name: 'paymentScreen',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return PaymentScreen(
            itemsList: data['cartItems'],
            totalPrice: data['total'],
          );
        },
      ),
       GoRoute(
        path: kReceiptScreen,
        name: 'receiptScreen',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ReceiptScreen(
            receipt: ReceiptModel(
              clientName: data['clientName'],
              phoneNumber: data['phoneNumber'],
              address: data['address'],
              deliveryMethod: data['deliveryMethod'],
              paymentMethod: data['paymentMethod'],
              totalPrice: data['totalPrice'],
              items: data['items'],
            ),
          );
        },
      ),
    ],
  );
}
