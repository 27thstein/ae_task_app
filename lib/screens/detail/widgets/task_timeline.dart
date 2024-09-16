import 'dart:math';

import 'package:ae_task_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeline extends StatefulWidget {
  final Task task;
  const TaskTimeline(this.task);

  @override
  State<TaskTimeline> createState() => _TaskTimelineState();
}

class _TaskTimelineState extends State<TaskTimeline> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.task.completed;
  }

  @override
  Widget build(BuildContext context) {
    final tColor = getRandomAccentColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        children: [
          _buildTimeline(tColor),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(Task.formatTimeOfDay(widget.task.time)),
                ),
                widget.task.title.isNotEmpty
                    ? _detailCard(
                        tColor,
                        widget.task.title,
                        widget.task.title,
                      )
                    : _detailCard(Colors.transparent, '', ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getRandomAccentColor() {
    List<Color> colors = [
      Colors.purple.shade50,
      Colors.deepPurple.shade50,
      Colors.red.shade200,
      Colors.blue.shade200,
      Colors.green.shade200,
      Colors.amber.shade200,
    ];

    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  Widget _buildTimeline(Color color) {
    return SizedBox(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        isFirst: true,
        lineXY: 0,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: color),
            ),
          ),
        ),
        afterLineStyle: LineStyle(thickness: 2, color: color),
      ),
    );
  }

  Widget _detailCard(Color bgColor, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      width: 250,
      height: 80,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
                widget.task.completed =
                    _isChecked; // Update the task's completed status
              });

              // context.read<TaskBloc>().add(UpdateTask(widget.task));
            },
          ),
        ],
      ),
    );
  }
}
