import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_offline/Models/task_model.dart';

CollectionReference<TaskModel> getDataFromFirebase() {
  return FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<TaskModel>(
          fromFirestore: (docSnapShot, _) {
            return TaskModel.fromJson(docSnapShot.data()!);
          },
          toFirestore: (task, _) => task.toJson());
}

Future AddTaskToFireStore(TaskModel task) async {
  var collection = await getDataFromFirebase();
  var doc = collection.doc();
  task.id = doc.id;
  return doc.set(task);
}

Future<void> deleteFromFireBase(TaskModel task) {
  var collection = getDataFromFirebase();
  return collection.doc(task.id).delete();
}

Future<QuerySnapshot<TaskModel>> GetTaskFromFireStore(DateTime time) async {
  var collection = await getDataFromFirebase();
  return collection
      .where('selectedDate',
          isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch)
      .get();
}

Stream<QuerySnapshot<TaskModel>> GetTaskFromFireStoreUsingStream(
    DateTime time) {
  var collection = getDataFromFirebase();
  return collection
      .where('selectedDate',
          isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch)
      .snapshots();
}
