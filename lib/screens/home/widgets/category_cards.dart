import 'package:ae_task_app/models/category_model.dart';
import 'package:ae_task_app/models/task.dart';
import 'package:ae_task_app/screens/detail/detail_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CategoryCards extends StatelessWidget {
  final List<CategoryModel> categoryList = CategoryModel.generateCategories();
  final List<Task> tasks;
  CategoryCards({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    // Filter the categories that have associated tasks
    final categoriesWithTasks = categoryList.where((category) {
      return tasks.any((task) => task.category == category.name) ||
          category.isLast == true;
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // Disable inner scrolling
        itemCount: categoriesWithTasks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final category = categoriesWithTasks[index];

          // Filter tasks for this specific category
          final tasksForCategory =
              tasks.where((task) => task.category == category.name).toList();

          return category.isLast != null && category.isLast!
              ? _buildAddcategoryCard()
              : _buildCategoryCard(context, category, tasksForCategory);
        },
      ),
    );
  }
}

// Build card for regular categoryModel
Widget _buildCategoryCard(
    BuildContext context, CategoryModel categoryModel, List<Task> tasksForCategory) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contex) => DetailPage(categoryModel, tasksForCategory),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: categoryModel.bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(categoryModel.icon, color: categoryModel.iconColor, size: 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryModel.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  _buildcategoryStatus(categoryModel.left!, categoryModel.done!,
                      categoryModel.iconColor!),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

//widget to display categoryModel status (left/done categorys)
Widget _buildcategoryStatus(num left, num done, Color iconColor) {
  return Row(
    children: [
      _buildStatusCircle(left, 'left', Colors.white),
      const SizedBox(width: 8),
      _buildStatusCircle(done, 'done', iconColor),
    ],
  );
}

//widget to build status circles
Widget _buildStatusCircle(num value, String label, Color color) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Text(
          value.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(color: Colors.black)),
    ],
  );
}

// Add categoryModel Button

Widget _buildAddcategoryCard() {
  return GestureDetector(
    onTap: () {},
    child: DottedBorder(
      color: Colors.grey,
      borderType: BorderType.RRect,
      radius: const Radius.circular(15),
      dashPattern: const [6, 3],
      strokeWidth: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 50, color: Colors.grey),
        ),
      ),
    ),
  );
}
