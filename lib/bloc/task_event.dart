part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}


class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

class LoadTasks extends TaskEvent {}

class LoadCategories extends TaskEvent {}