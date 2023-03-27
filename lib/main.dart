import 'package:flutter/material.dart';
import 'package:tugas2/list_page.dart';
import 'package:tugas2/login_page.dart';

void main() {
  runApp(const AppTourism());
}

class AppTourism extends StatelessWidget {
  const AppTourism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism Place',
      initialRoute: '/',
      routes: {
        '/list': (context) => ListPage(),
      },
      theme : ThemeData(
        primarySwatch : Colors.lime,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

