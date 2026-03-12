import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/Home_Feature/presentation/search_result_screen/searchResultScreen.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final TextEditingController controller = TextEditingController();

  void goToSearch() {
    final q = controller.text.trim();
    if (q.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            SearchResultScreen(initialQuery: q, controller: controller),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => goToSearch(),
          decoration: InputDecoration(
            hintText: 'Search food...',
            hintStyle: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Color(0xFFAAAAAA)),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFFA4A0C),
                size: 18,
              ),
              onPressed: goToSearch,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}
