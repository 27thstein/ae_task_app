import 'package:ae_task_app/models/category_model.dart';
import 'package:ae_task_app/models/task.dart';
import 'package:ae_task_app/screens/detail/widgets/date_picker.dart';
import 'package:ae_task_app/screens/detail/widgets/task_timeline.dart';
import 'package:ae_task_app/screens/detail/widgets/tasks_header.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final CategoryModel categoryModel;
  final List<Task> tasksForCategory;

  const DetailPage(this.categoryModel, this.tasksForCategory);

  @override
  Widget build(BuildContext context) {
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => TaskTimeline(tasksForCategory[index]),
              childCount: tasksForCategory.length,
            ),
          ),
          SliverFillRemaining(
            child: Container(color: Colors.white, child: const Center()),
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
              '${categoryModel.name} Tasks',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'You have ${categoryModel.left} categorys today!',
              style: TextStyle(fontSize: 12.0, color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }
}
