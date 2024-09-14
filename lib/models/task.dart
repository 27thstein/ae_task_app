import 'package:ae_task_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Task {
  IconData? icon;
  String? title;
  Color? iconColor;
  Color? bgColor;
  Color? btnColor;
  List<Map<String, dynamic>>? desc;
  num? left;
  num? done;
  bool? isLast;

  Task({
    this.icon,
    this.title,
    this.iconColor,
    this.bgColor,
    this.btnColor,
    this.desc,
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
          desc: [
            {
              'time': '9:00 am',
              'title': 'Go for a wal with dog',
              'slot': '9:00 - 10:00',
              'tlColor': TColors.red,
              'bgColor': TColors.redAccent,
            },
            {
              'time': '10:00 am',
              'title': 'Shot on Dribbble',
              'slot': '10:00 - 12:00',
              'tlColor': TColors.purple,
              'bgColor': TColors.purpleAccent,
            },
            {
              'time': '11:00 am',
              'title': '',
              'slot': '',
              'tlColor': TColors.purple,
              'bgColor': TColors.purpleAccent,
            },
            {
              'time': '12:00 pm',
              'title': '',
              'slot': '',
              'tlColor': TColors.purple,
              'bgColor': TColors.purpleAccent,
            },
            {
              'time': '1:00 pm',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
              'bgColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '2:00 pm',
              'title': 'Call with Client',
              'slot': '2:00 - 3:00',
              'tlColor': TColors.blue,
              'bgColor': TColors.blueAccent,
            }
          ]),
      Task(
          icon: Icons.cases_outlined,
          title: 'Work',
          iconColor: TColors.purple,
          bgColor: TColors.purpleAccent,
          btnColor: const Color.fromARGB(192, 193, 169, 250),
          left: 1,
          done: 3,
          desc: [
            {
              'time': '9:00 am',
              'title': 'Zoom Meeting',
              'slot': '9:00 - 10:00',
              'tlColor': TColors.purple,
              'bgColor': TColors.purpleAccent,
            },
            {
              'time': '10:00 am',
              'title': 'Sho0t at photo studio',
              'slot': '10:00 - 12:00',
              'tlColor': TColors.red,
              'bgColor': TColors.redAccent,
            },
            {
              'time': '11:00 am',
              'title': '',
              'slot': '',
              'tlColor': TColors.red,
              'bgColor': TColors.redAccent,
            },
            {
              'time': '12:00 pm',
              'title': '',
              'slot': '',
              'tlColor': TColors.red,
              'bgColor': TColors.redAccent,
            },
            {
              'time': '1:00 pm',
              'title': 'Appointment with Doctor',
              'slot': '1:00 - 2:00',
              'tlColor': Colors.blue.withOpacity(0.3),
              'bgColor': Colors.blueAccent.withOpacity(0.3),
            },
            {
              'time': '2:00 pm',
              'title': 'Call with Client',
              'slot': '2:00 - 3:00',
              'tlColor': TColors.blue,
              'bgColor': TColors.blueAccent,
            },
            {
              'time': '3:00 pm',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
              'bgColor': Colors.grey.withOpacity(0.3),
            },
          ]),
      Task(
          icon: Icons.favorite_rounded,
          title: 'Health',
          iconColor: TColors.blue,
          bgColor: TColors.blueAccent,
          btnColor: const Color.fromARGB(255, 128, 216, 245),
          left: 2,
          done: 1,
          //  desc:
          //  [
          //   {
          //     'time': '9:00 am',
          //     'title': 'Go for a wal with dog',
          //     'slot': '9:00 - 10:00',
          //     'tlColor': TColors.blue,
          //     'bgColor': TColors.blueAccent,
          //   },
          //   {
          //     'time': '10:00 am',
          //     'title': 'Shot on Dribbble',
          //     'slot': '10:00 - 12:00',
          //     'tlColor': TColors.purple,
          //     'bgColor': TColors.purpleAccent,
          //   },
          //   {
          //     'time': '11:00 am',
          //     'title': '',
          //     'slot': '',
          //     'tlColor': TColors.purple,
          //     'bgColor': TColors.purpleAccent,
          //   },
          //   {
          //     'time': '12:00 pm',
          //     'title': '',
          //     'slot': '',
          //     'tlColor': TColors.purple,
          //     'bgColor': TColors.purpleAccent,
          //   },
          //   {
          //     'time': '1:00 pm',
          //     'title': '',
          //     'slot': '',
          //     'tlColor': Colors.grey.withOpacity(0.3),
          //     'bgColor': Colors.grey.withOpacity(0.3),
          //   },
          //   {
          //     'time': '2:00 pm',
          //     'title': 'Call with Client',
          //     'slot': '2:00 - 3:00',
          //     'tlColor': TColors.red,
          //     'bgColor': TColors.redAccent,
          //   }
          // ]
         ),
      Task(isLast: true),
    ];
  }
}
