import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/bloc_observer.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/product_control/cart_cubit.dart';
import 'package:food_delivery_app/core/product_control/cart_repo.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodCubit.dart';
import 'package:food_delivery_app/features/auth_screen/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:food_delivery_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthCubit()),
            BlocProvider(create: (context) => FoodCubit()..getFood()),
            BlocProvider(
              create: (context) =>
                  CartCubit(CartRepo(FirebaseFirestore.instance)),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,

            theme: ThemeData(
              // scaffoldBackgroundColor: backgroundColor,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              appBarTheme: AppBarTheme(
                backgroundColor: backgroundColor,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle
                    .light, // Set status bar text color to light
                // Set status bar background color to transparent
              ),
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
