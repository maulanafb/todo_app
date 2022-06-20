import 'package:flutter/material.dart';
import 'package:todo_app/pages/add_todo.dart';
import 'package:todo_app/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      routes: {
        'homepage': (context) => HomePage(),
        'add_todo': (context) => AddTodo(),
      },
      initialRoute: 'homepage',
    );
  }
}
