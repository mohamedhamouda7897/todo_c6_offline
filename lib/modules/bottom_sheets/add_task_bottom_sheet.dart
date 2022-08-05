import 'package:flutter/material.dart';
import 'package:todo_c6_offline/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(16) ,topRight: Radius.circular(16)),
      ),
      padding: EdgeInsets.all(12),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',style: Theme.of(context).textTheme.headline1?.copyWith(
              color: Colors.black
            ),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            TextFormField(
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                  labelText: 'Description'
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Select Time',style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(
              height: 8,
            ),
            Text('12/10/2022',style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: (){}, child: Text('Add Task'))

          ],
        ),
      ),
    );
  }
}
