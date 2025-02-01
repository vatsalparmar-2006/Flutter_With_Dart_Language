import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormats extends StatefulWidget {
  const DateFormats({super.key});

  @override
  State<DateFormats> createState() => _DateFormatsState();
}

class _DateFormatsState extends State<DateFormats> {
  DateTime date = DateTime.now();

  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  Map<String, List<String>> timetable = {
    "monday": [
      "Mathematics",
      "Physics",
      "Chemistry",
      "Biology",
      "English Literature",
      "History"
    ],
    "tuesday": [
      "Computer Science",
      "Geography",
      "Economics",
      "Philosophy",
      "Art and Design",
      "Engineering Mechanics"
    ],
    "wednesday": [
      "Physics",
      "Biology",
      "Mathematics",
      "Economics",
      "History",
      "Philosophy"
    ],
    "thursday": [
      "Chemistry",
      "English Literature",
      "Art and Design",
      "Geography",
      "Computer Science",
      "Biology"
    ],
    "friday": [
      "Engineering Mechanics",
      "History",
      "Mathematics",
      "Philosophy",
      "Physics",
      "Economics"
    ],
    "saturday": [
      "Physics",
      "Economics",
      "Mathematics",
      "Philosophy",
      "Engineering Mechanics",
      "History"
    ],
    "sunday": [
      "Picnic",
    ],
  };

  String selectedDay = "Monday"; // Updated to match capitalization

  @override
  Widget build(BuildContext context) {
    String s1 = DateFormat("dd/MM/yyyy").format(date);
    String s2 = DateFormat("dd-MM-yyyy").format(date);
    String s3 = DateFormat("dd-MMM-yyyy").format(date);
    String s4 = DateFormat("dd-MM-yy").format(date);
    String s5 = DateFormat("dd MMM, yyyy").format(date);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Date & Time Formats Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                date.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Formats of DateTime",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "$s1\n$s2\n$s3\n$s4\n$s5\n",
                style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? d = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2027));

                  if (d != null) {
                    setState(() {
                      date = d;
                    });
                  }
                },
                child: const Text("Select Date"),
              ),
              const SizedBox(height: 30),
              DropdownButton<String>(
                value: selectedDay,
                items: days.map((day) {
                  return DropdownMenuItem(
                    value: day,
                    child: Text(day.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDay = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              getDayWiseTimetable(selectedDay),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDayWiseTimetable(String day) {
    String key = day.toLowerCase(); // Convert day to lowercase for map lookup
    List<String>? lectures = timetable[key];

    if (lectures == null || lectures.isEmpty) {
      return const Center(
        child: Text(
          "No timetable available.",
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      );
    }

    return Column(
      children: lectures.map((lecture) {
        return Card(
          elevation: 10,
          child: ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: Text(
              lecture,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      }).toList(),
    );
  }
}
