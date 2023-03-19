import 'package:flutter/material.dart';
import 'package:networking2/model/employee_list.dart';
import 'package:networking2/pages/details_page.dart';
import 'package:networking2/pages/home_page.dart';
import 'package:networking2/services/api.dart';

import 'model/employee_get.dart';
import 'model/response_emp_single.dart';
import 'pages/create_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

