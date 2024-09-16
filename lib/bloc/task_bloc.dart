import 'package:ae_task_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {

    // Handler for loading tasks
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await loadTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError('Failed to load tasks'));
      }
    });

    // Handler for adding a task
    on<AddTask>((event, emit) async {
      final currentState = state;
      if (currentState is TaskLoaded) {
        final tasks = List<Task>.from(currentState.tasks)..add(event.task);
        await saveTasks(tasks);
        emit(TaskLoaded(tasks));
      }
    });
  }

  // Save tasks to SharedPreferences
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList('tasks', tasksJson);
  }

  // Load tasks from SharedPreferences
  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? tasksJson = prefs.getStringList('tasks');
    if (tasksJson != null) {
      return tasksJson.map((json) => Task.fromJson(json)).toList();
    }
    return [];
  }
}
