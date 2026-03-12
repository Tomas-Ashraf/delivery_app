import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/widgets/reusedAppBar.dart';
import 'package:food_delivery_app/features/Home_Feature/manager/searchCubit.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/search_result_screen/gridDesign.dart';

class SearchResultScreen extends StatefulWidget {
  final String initialQuery;
  final TextEditingController controller;

  const SearchResultScreen({
    super.key,
    required this.initialQuery,
    required this.controller,
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late SearchCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SearchCubit();

    // سيرش بالـ query الأولي
    _cubit.search(widget.initialQuery);

    // ✅ استمع لكل تغيير في الـ controller
    widget.controller.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    _cubit.search(widget.controller.text.trim());
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onQueryChanged);
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: buildAppBar(context, 'Search Results'),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            // ── لودينج ───────────────────────────────────────────────
            if (state is SearchInitial || state is SearchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // ── ايرور ────────────────────────────────────────────────
            if (state is SearchError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => _cubit.search(widget.controller.text),
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }

            // ── فاضي ─────────────────────────────────────────────────
            if (state is SearchLoaded && state.items.isEmpty) {
              return const Center(
                child: Text(
                  'No results found',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }

            // ── داتا ─────────────────────────────────────────────────
            final items = (state as SearchLoaded).items;
            return Column(
              children: [
                _ResultsCount(count: items.length),
                Expanded(child: GridDesign(items: items)),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ── Results Count ─────────────────────────────────────────────────────────────
class _ResultsCount extends StatelessWidget {
  final int count;
  const _ResultsCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          children: [
            const TextSpan(text: 'Found  '),
            TextSpan(
              text: '$count',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            const TextSpan(text: '  results'),
          ],
        ),
      ),
    );
  }
}
