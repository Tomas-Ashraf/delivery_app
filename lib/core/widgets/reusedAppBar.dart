import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
  String? title, {
  bool favorite = true,
  void Function()? onFavoritePressed,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
      onPressed: () => Navigator.pop(context),
    ),
    actions: [
      if (favorite)
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.black87),
          onPressed: () {
            onFavoritePressed?.call();
          },
        ),
    ],
    title: Text(title ?? '', style: Styles.textStyle20),
    centerTitle: true,
  );
}
