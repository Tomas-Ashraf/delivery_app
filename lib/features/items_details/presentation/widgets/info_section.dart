// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget InfoSection({required String title, required String content}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
        ),
      ],
    ),
  );
}
