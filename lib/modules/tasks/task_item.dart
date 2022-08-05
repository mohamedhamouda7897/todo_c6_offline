import 'package:flutter/material.dart';
import 'package:todo_c6_offline/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      height: size.height*.10,
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
          Expanded(child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text('Task Title',style: Theme.of(context).textTheme.headline2,),
              Text('Task Title',style: Theme.of(context).textTheme.subtitle1,),

            ],
          )),
          Container(

              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(12)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              child: Icon(Icons.check,color: Colors.white,size: 30,))
        ],
      ),
    );
  }
}
