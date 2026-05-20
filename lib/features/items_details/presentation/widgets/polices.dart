import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/items_details/presentation/widgets/info_section.dart';

class ItemPolices {
  String deliveryContent;
  String returnContent;

  ItemPolices(this.deliveryContent, this.returnContent);

  Widget deliveryInfo() {
    return InfoSection(title: 'Delivery Info', content: deliveryContent);
  }

  Widget returnPolicy() {
    return InfoSection(title: 'Return Policy', content: returnContent);
  }
}
