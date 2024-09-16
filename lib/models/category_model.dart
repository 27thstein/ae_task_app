import 'package:ae_task_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryModel {
   String name;        // Changed from String? to String
  Color? bgColor;
  Color? iconColor;
  Color? tlColor;
  IconData? icon;
  int? left;
  int? done;
  bool? isLast;

  CategoryModel({
    required this.name,  // Make name a required non-nullable parameter
    this.icon,
    this.bgColor,
    this.iconColor,
    this.tlColor,
    this.left,
    this.done,
    this.isLast = false,
  });

  static List<CategoryModel> generateCategories() {
    return [
      CategoryModel(
          name: 'Personal',
          icon: Icons.person,
          bgColor: TColors.redAccent,
          iconColor: const Color.fromARGB(255, 245, 177, 177),
          tlColor: TColors.red,
          left: 3,
          done: 1),
      CategoryModel(
          name: 'Work',
          icon: Icons.cases_outlined,
          bgColor: TColors.purpleAccent,
          iconColor: const Color.fromARGB(255, 202, 183, 248),
          tlColor: TColors.purple,
          left: 3,
          done: 1),
      CategoryModel(
          name: 'Health',
          icon: Icons.favorite,
          bgColor: TColors.blueAccent,
          iconColor: const Color.fromARGB(255, 185, 232, 247),
          tlColor: TColors.blue,
          left: 3,
          done: 1),
      CategoryModel(
          name: 'Other',
          icon: Icons.book_rounded,
          bgColor: TColors.yellowAccent,
          iconColor: const Color.fromARGB(255, 248, 233, 176),
          tlColor: TColors.yellow,
          left: 3,
          done: 1),
      CategoryModel(name: 'add-category', isLast: true),
    ];
  }
}
