import 'package:ae_task_app/bloc/task_bloc.dart';
import 'package:ae_task_app/constants/colors.dart';
import 'package:ae_task_app/models/category_model.dart';
import 'package:ae_task_app/models/task.dart';
import 'package:ae_task_app/screens/home/widgets/category_cards.dart';
import 'package:ae_task_app/screens/home/widgets/task_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

   HomePage({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _tAppBar(),
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => TaskBottomSheet(),
          );
        },
        elevation: 0,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // INFO BANNER
            infoBanner(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Tasks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),

            // BlocBuilder to check the state
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  // Show a loading indicator if the tasks are still loading
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TaskError) {
                  // Show an error message if something went wrong
                  return const Center(child: Text('Error loading tasks'));
                } else if (state is TaskLoaded) {
                  if (state.tasks.isEmpty) {
                    // Display a message or placeholder if no tasks are available
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Center(
                        child: Text(
                          'No tasks available. Add a task to get started!',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    );
                  } else {
                    // Display the category cards with tasks
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CategoryCards(tasks: state.tasks),
                    );
                  }
                }
                return const SizedBox(); // Fallback in case state is unexpected
              },
            ),
          ],
        ),
      ),
    );
  }

  Stack infoBanner() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white30,
                radius: 16,
                child: Center(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Go Premium!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Get unlimited access \nto all our features!',
                    style: TextStyle(color: Colors.white54, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: Container(
            height: 40,
            width: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 71, 143, 243),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

// BOTTOM NAVIGATION BAR
  Widget _bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 20,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          key: super.key,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: TColors.blue,
          unselectedItemColor: Colors.grey.withOpacity(0.9),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
                size: 30,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    );
  }

// APP BAR
  AppBar _tAppBar() {
    return AppBar(
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(1),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/avatar-14.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Hi, Reave',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_sharp),
        ),
      ],
    );
  }
}
