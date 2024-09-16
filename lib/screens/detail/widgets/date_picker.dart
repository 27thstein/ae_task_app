// import 'package:flutter/material.dart';

// class DatePicker extends StatefulWidget {
//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   final weekList = [
//     'Sun',
//     'Mon',
//     'Tue',
//     'Wed',
//     'Thu',
//     'Fri',
//     'Sat',
//   ];
//   final dayList = [
//     '25',
//     '26',
//     '27',
//     '28',
//     '29',
//     '30',
//     '31',
//   ];

//   var selectedIndex = 4;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   margin: const EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: selectedIndex == index
//                         ? Colors.grey.shade200
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         weekList[index],
//                         style: TextStyle(
//                           color: selectedIndex == index
//                               ? Colors.black
//                               : Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         dayList[index],
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                           fontSize: 16,
//                           color: selectedIndex == index
//                               ? Colors.black
//                               : Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           separatorBuilder: (_, index) => const SizedBox(
//                 width: 5,
//               ),
//           itemCount: weekList.length),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  List<String> weekList = [];
  List<String> dayList = [];
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _generateWeekDates();
  }

  void _generateWeekDates() {
    // Get the current date
    DateTime now = DateTime.now();
    // Find the first day of the current week (Sunday)
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday % 7));

    // Clear any existing dates in the lists
    weekList.clear();
    dayList.clear();

    // Generate dates for the current week (Sunday to Saturday)
    for (int i = 0; i < 7; i++) {
      DateTime currentDay = startOfWeek.add(Duration(days: i));

      // Format the day (e.g., "25") and weekday (e.g., "Sun")
      String day = DateFormat.d().format(currentDay); // Day number
      String weekday = DateFormat.E().format(currentDay); // Weekday name

      dayList.add(day);
      weekList.add(weekday);
    }

    // Automatically set the current day as the selected index
    setState(() {
      selectedIndex = now.difference(startOfWeek).inDays; // Current day of the week (0-6)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Colors.grey.shade200
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  weekList[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  dayList[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: selectedIndex == index ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 5),
        itemCount: weekList.length,
      ),
    );
  }
}
