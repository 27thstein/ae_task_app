part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

class TaskInitial extends TaskState {}


class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded(this.tasks);
}


class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}