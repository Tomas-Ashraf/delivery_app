import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodCubit.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodState.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/cardShimmer.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/foodCard.dart';
import 'package:food_delivery_app/features/items_details/presentation/items_details.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodLoading || state is FoodInitial) {
          return const ItemListShimmer();
        }

        if (state is FoodError) {
          return Center(child: Text(state.message));
        }

        if (state is FoodLoaded) {
          if (state.items.isEmpty) {
            return const Center(child: Text('No items found'));
          }

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 200.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.items.length,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ItemDetails(product: state.items[index]),
                        ),
                      );
                    },
                    child: FoodCard(item: state.items[index]),
                  );
                },
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
