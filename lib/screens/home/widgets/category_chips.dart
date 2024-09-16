import 'package:ae_task_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged<String> onCategorySelected; // Callback to notify parent

  CategoryChips({super.key, required this.onCategorySelected});

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int selectedIndex = -1; // No chip is selected initially

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.generateCategories()
        .where((category) => category.isLast != true)
        .toList();

    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.onCategorySelected(category.name ?? 'Unnamed');
              });
            },
            child: Chip(
              backgroundColor:
                  selectedIndex == index ? Colors.grey.shade200 : Colors.white,
              label: Text(category.name ?? 'Unnamed'),
              side: BorderSide(
                color: selectedIndex == index
                    ? Colors.black
                    : const Color.fromARGB(96, 94, 94, 94),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 5),
      ),
    );
  }
}
