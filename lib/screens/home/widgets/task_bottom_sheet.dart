import 'package:ae_task_app/bloc/task_bloc.dart';
import 'package:ae_task_app/models/task.dart';
import 'package:ae_task_app/screens/home/widgets/category_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Choose Category',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CategoryChips(
              onCategorySelected: (categoryName) {
                setState(() {
                  _selectedCategory = categoryName;
                });
              },
            ),
          ),
          ListTile(
            title: Text(_selectedDate == null
                ? 'Choose Date'
                : 'Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  _selectedDate = pickedDate;
                });
              }
            },
          ),
          ListTile(
            title: Text(_selectedTime == null
                ? 'Choose Time'
                : 'Time: ${_selectedTime!.format(context)}'),
            trailing: const Icon(Icons.access_time),
            onTap: () async {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                setState(() {
                  _selectedTime = pickedTime;
                });
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Button pressed');

                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty &&
                    _selectedCategory != null &&
                    _selectedDate != null &&
                    _selectedTime != null) {
                  final newTask = Task(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    category: _selectedCategory!,
                    date: _selectedDate!,
                    time: _selectedTime!,
                  );
                  debugPrint('Task Created');
                  context.read<TaskBloc>().add(AddTask(newTask));
                  Navigator.pop(context);
                } else {
                   Navigator.pop(context);
                  // Show SnackBar if fields are missing
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      showCloseIcon: true,
                      behavior: SnackBarBehavior.floating,
                      content: Text('All fields are required!'),
                      margin: EdgeInsets.only(
                        top: kToolbarHeight + 10, // Just below the AppBar
                        left: 20,
                        right: 20,
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  elevation: WidgetStatePropertyAll(0),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  )),
              child: const Text('Add Task'),
            ),
          ),
        ],
      ),
    );
  }
}
