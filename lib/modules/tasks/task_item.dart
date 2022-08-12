import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_c6_offline/Models/task_model.dart';
import 'package:todo_c6_offline/shared/styles/colors.dart';

import '../../utils/firebase_firestore.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Slidable(
      closeOnScroll: true,
      startActionPane:
          ActionPane(extentRatio: 0.25, motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            deleteFromFireBase(taskModel);
          },
          borderRadius: BorderRadius.circular(12),
          icon: Icons.delete,
          backgroundColor: Theme.of(context).colorScheme.error,
          label: 'Delete',
        )
      ]),
      child: Container(
        height: size.height * .10,
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: WhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 3,
              color: PrimaryColor,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${taskModel.title}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${taskModel.description}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            )),
            Container(
                decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
