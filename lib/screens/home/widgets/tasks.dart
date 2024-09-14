import 'package:ae_task_app/models/task.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  final taskList = Task.generateTasks();

  Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: taskList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return taskList[index].isLast!
              ? _buildAddTaskCard()
              : _buildTaskCard(
                  context,
                  taskList[index],
                );
        },
      ),
    );
  }
}

// Build card for regular task
Widget _buildTaskCard(BuildContext context, Task task) {
  return Container(
    decoration: BoxDecoration(
      color: task.bgColor,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(task.icon, color: task.iconColor, size: 35),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task.title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                _buildTaskStatus(task.left!, task.done!, task.btnColor!),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

//widget to display task status (left/done tasks)
Widget _buildTaskStatus(num left, num done, Color btnColor) {
  return Row(
    children: [
      _buildStatusCircle(left, 'left', Colors.white),
      const SizedBox(width: 8),
      _buildStatusCircle(done, 'done', btnColor),
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

// Add Task Button

Widget _buildAddTaskCard() {
  return GestureDetector(
    onTap: () {
     
    },
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
