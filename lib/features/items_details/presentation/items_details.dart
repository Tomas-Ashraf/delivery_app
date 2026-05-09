import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/spaces.dart';
import 'package:food_delivery_app/core/utils/styles.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/reusedAppBar.dart';
import 'package:food_delivery_app/features/items_details/manager/item_cubit.dart';
import 'package:food_delivery_app/features/items_details/manager/item_repo.dart';
import 'package:food_delivery_app/features/items_details/manager/item_states.dart';
import 'package:food_delivery_app/features/items_details/models/item_model.dart';
import 'package:food_delivery_app/features/items_details/presentation/shimmer_items_details.dart';
import 'package:food_delivery_app/features/items_details/presentation/widgets/foodinfo.dart';
import 'package:food_delivery_app/features/items_details/presentation/widgets/item_images_carosel.dart';
import 'package:food_delivery_app/features/items_details/presentation/widgets/polices.dart';

import '../../../constants.dart' as AppColors;

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int currentIndex = 0;
  bool isFavorite = false;
  ItemModel? itemModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ItemCubit(GetItemRepo(FirebaseFirestore.instance))..fetchItemData(),
      child: BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          // in case of loading state we will show a shimmer effect
          if (state is ItemLoadingState) {
            return FoodDetailShimmer();
          }

          // in case of failure state we will show an error message
          if (state is ItemFailureState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(context, null),
              body: Center(
                child: Text(
                  'Error: ${state.error}',
                  style: Styles.textStyle65.copyWith(color: Colors.red),
                ),
              ),
            );
          }

          // in case of success state we will get the item data and display it
          if (state is ItemSuccessState) {
            final item = state.itemModel;
            itemModel = item;

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(
                context,
                null,
                onFavoritePressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              body: Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 10, right: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          ImageCarousel(
                            images: item.images,
                            onChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                          // ImageIndicators(item),
                          Spaces.verticalSpace(25.h),
                          FoodItemInformation(
                            name: item.name,
                            price: item.price,
                          ),
                          Spaces.verticalSpace(50.h),
                          ItemPolices(
                            item.deliveryInfo,
                            item.returnPolicy,
                          ).deliveryInfo(),
                          Spaces.verticalSpace(30),
                          ItemPolices(
                            item.deliveryInfo,
                            item.returnPolicy,
                          ).returnPolicy(),
                        ],
                      ),
                    ),

                    CustomButton(
                      backgroundColor: item.isAvailable
                          ? AppColors.kPrimaryColor
                          : Colors.grey,
                      height: 56,
                      width: double.infinity,
                      radius: 28,
                      text: item.isAvailable
                          ? 'Add to cart'
                          : 'Unavailable Now',
                      onTap: () {},
                      textStyle: Styles.textStyle65.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
