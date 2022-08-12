import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_offline/Models/task_model.dart';
import 'package:todo_c6_offline/modules/tasks/task_item.dart';
import 'package:todo_c6_offline/shared/styles/colors.dart';

import '../../utils/firebase_firestore.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            activeDayColor: PrimaryColor,
            activeBackgroundDayColor: WhiteColor,
            dotsColor: PrimaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: GetTaskFromFireStoreUsingStream(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('something went wrong');
                }
                List<TaskModel> Tasks =
                    snapshot.data!.docs.map((e) => e.data()).toList();
// 1660341600000000
// 1660341600000000
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return TaskItem(Tasks[index]);
                  },
                  itemCount: Tasks.length,
                );
              },
              // child: L
            ),
          )
        ],
      ),
    );
  }
}
