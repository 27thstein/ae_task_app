import 'package:ae_task_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Task {
  IconData? icon;
  String? title;
  Color? iconColor;
  Color? bgColor;
  Color? btnColor;
  num? left;
  num? done;
  bool? isLast;

  Task({
    this.icon,
    this.title,
    this.iconColor,
    this.bgColor,
    this.btnColor,
    this.isLast = false,
    this.done,
    this.left,
  });

  static List<Task> generateTasks() {
    return [
      Task(
        icon: Icons.person,
        title: 'Personal',
        iconColor: TColors.red,
        bgColor: TColors.redAccent,
        btnColor: const Color.fromARGB(190, 245, 151, 151),
        left: 3,
        done: 1,
      ),
      Task(
        icon: Icons.cases_outlined,
        title: 'Work',
        iconColor: TColors.purple,
        bgColor: TColors.purpleAccent,
        btnColor: const Color.fromARGB(192, 193, 169, 250),
        left: 1,
        done: 3,
      ),
      Task(
        icon: Icons.favorite_rounded,
        title: 'Health',
        iconColor: TColors.blue,
        bgColor: TColors.blueAccent,
        btnColor: const Color.fromARGB(255, 128, 216, 245),
        left: 2,
        done: 1,
      ),
      Task(isLast: true),
    ];
  }
}
