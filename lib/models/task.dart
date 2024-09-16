import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Define the Task model
class Task {
  final String title;
  final String description;
  final String category;
  final DateTime date;
  final TimeOfDay time;
  bool completed;

  Task({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    this.completed = false,
  });

  // Convert TimeOfDay to formatted string
  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    return DateFormat.Hm().format(dateTime);
  }

  // Convert Task to a Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
      'time': formatTimeOfDay(time),
      'completed': completed,
    };
  }

  // Convert Map to Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      category: map['category'],
      date: DateTime.parse(map['date']),
      time: TimeOfDay(
        hour: int.parse(map['time'].split(':')[0]),
        minute: int.parse(map['time'].split(':')[1]),
      ),
      completed: map['completed'],
    );
  }

  // Convert Task to JSON
  String toJson() => json.encode(toMap());

  // Convert JSON to Task
  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
