import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/reusedAppBar.dart';
import 'package:food_delivery_app/features/History_Feature/emptyHistoryCase.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'History'),
      body: emptyHistoryState(context),
    );
  }
}
