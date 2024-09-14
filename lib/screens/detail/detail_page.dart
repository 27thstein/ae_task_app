import 'package:ae_task_app/models/task.dart';
import 'package:ae_task_app/screens/detail/widgets/date_picker.dart';
import 'package:ae_task_app/screens/detail/widgets/task_timeline.dart';
import 'package:ae_task_app/screens/detail/widgets/tasks_header.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  const DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    final detailsList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _detailAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DatePicker(),
                  const TasksHeader(),
                ],
              ),
            ),
          ),
          detailsList == null
              ? SliverFillRemaining(
                  child: Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'No tasks today!',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      )),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => TaskTimeline(detailsList[index]),
                    childCount: detailsList.length,
                  ),
                )
        ],
      ),
    );
  }

  Widget _detailAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ))
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} tasks',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'You have ${task.left} tasks today!',
              style: TextStyle(fontSize: 12.0, color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }
}
