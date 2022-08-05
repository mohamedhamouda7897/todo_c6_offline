import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_offline/layout/home_layout.dart';
import 'package:todo_c6_offline/shared/styles/my_themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.
  initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeLayout.routeName,
      routes:{
        HomeLayout.routeName : (c)=>HomeLayout()
      } ,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme ,

    );
  }
}
