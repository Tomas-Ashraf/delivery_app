import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/styles.dart';

class DeliveryOption extends StatelessWidget {
  final String label;
  final int value;
  final bool showDivider;
  final ValueChanged<int?> onChanged;
  final int groupValue;

  const DeliveryOption({
    required this.label,
    required this.value,
    required this.showDivider,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return Column(
      children: [
        InkWell(
          onTap: () => onChanged(value),

          borderRadius: BorderRadius.vertical(
            top: value == 0 ? const Radius.circular(14) : Radius.zero,
            bottom: value == 1 ? const Radius.circular(14) : Radius.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFE8622A)
                          : const Color(0xFFCCCCCC),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE8622A),
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: Styles.textStyle17.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Color(0xFFF0F0F0),
          ),
      ],
    );
  }
}
