import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodCubit.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/foodState.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/cardShimmer.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/widgets/foodCard.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        //in case of loading
        if (state is FoodInitial || state is FoodLoading) {
          return const ItemListShimmer();
        }

        //in case of error
        if (state is FoodError) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.grey, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.read<FoodCubit>().getFood(),
                    child: const Text('Try again'),
                  ),
                ],
              ),
            ),
          );
        }

        //in case of empty
        if (state is FoodLoaded && state.items.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text(
                'No items found',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        }

        // in case of data loaded successfully and show the list of items
        final items = (state as FoodLoaded).items;

        return Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 8,
              top: 8,
              bottom: 16,
            ),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) => FoodCard(item: items[index]),
          ),
        );
      },
    );
  }
}
