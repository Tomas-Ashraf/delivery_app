import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

PreferredSizeWidget buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(title, style: Styles.textStyle20),
    centerTitle: true,
  );
}
