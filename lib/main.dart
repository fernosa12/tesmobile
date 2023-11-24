import 'package:flutter/material.dart';
import 'package:tesmobile/page/add_todo.dart';
import 'package:tesmobile/page/home_page.dart';
import 'package:tesmobile/page/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        'home_page': (context) => const TodoList(),
        'add_todo': (context) => const AddTodo(),
        "login_view": (context) => const LoginPage(),
      },
      initialRoute: 'login_view',
    );
  }
}
