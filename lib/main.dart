import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/Home/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeWidget(),
      //
      // MaterialApp.router(
      //   routerConfig: AppRouter.router,
      //   debugShowCheckedModeBanner: false,
      // )
    );
  }
}
