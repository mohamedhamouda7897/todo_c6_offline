import 'package:flutter/material.dart';
import 'package:todo_c6_offline/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {



  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate=DateTime.now();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: WhiteColor,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(16) ,topRight: Radius.circular(16)),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',style: Theme.of(context).textTheme.headline1?.copyWith(
              color: Colors.black
            ),
              textAlign: TextAlign.center,
            ),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(

                decoration: InputDecoration(labelText: 'Title'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter task title';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLines: 4,
                minLines: 4,

                decoration: InputDecoration(labelText: 'Description'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter task description';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),

            SizedBox(
              height: 12,
            ),
            Text('Select Time',style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: (){
                openDatePicker();
              },
              child: Text('${selectedDate.year}/ ${selectedDate.month} / ${selectedDate.day}',
                style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()){


              }

            }, child: Text('Add Task'))
 // 'insert ito tasks values()'
          ],
        ),
      ),
    );
  }

  openDatePicker()async {
    var choosenDate= await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))

    );

    if(choosenDate !=null)
    selectedDate=choosenDate;
    setState(() {

    });
  }
}