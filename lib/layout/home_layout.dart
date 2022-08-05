import 'package:flutter/material.dart';
import 'package:todo_c6_offline/modules/settings/settings.dart';
import 'package:todo_c6_offline/modules/tasks/tasks.dart';
import 'package:todo_c6_offline/shared/styles/colors.dart';

import '../modules/bottom_sheets/add_task_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {

  static const String routeName='/';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;

  List<Widget>tabs=[TasksScreen(),SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Route',style: Theme.of(context).textTheme.headline1,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
         shape: StadiumBorder(
           side: BorderSide(
             color: WhiteColor,
                 width: 4,
           )
         ),
        onPressed: (){
           OpenBottomSheetToAddTask();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          onTap: (index){
            currentIndex=index;
            setState(() {

            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }
  OpenBottomSheetToAddTask(){
    showModalBottomSheet(context: context, builder: (context){
      return AddTaskBottomSheet();
    });
  }
}
