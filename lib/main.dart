import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:networking2/services/api.dart';

import 'model/post.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String res = "";
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    //getApi();
    // postApi();
    //putApi();
    deleteApi();
    super.initState();
  }

  void getApi() {
    setState(() {
      isLoading = true;
    });
    ApiService.getMethod().then((v) {
      setState(() {
        res = v;
        isLoading = false;
      });
    });
  }

  void postApi() {
    setState(() {
      isLoading = true;
    });
    Employee employee = Employee(name: "Yuluzcha", salary: "1000\$", age: 2);
    ApiService.postMethod(employee).then((javob) {
      setState(() {
        res = javob;
        isLoading = false;
      });
    });
  }

  void putApi() {
    setState(() {
      isLoading = true;
    });

    Employee employee = Employee(name: "Yuluzcha", salary: "1000\$", age: 2);
    ApiService.putMethod(employee, 2108).then((value) {
      setState(() {
        res = value;
        isLoading = false;
      });
    });
  }

  void deleteApi() {
    setState(() {
      isLoading = true;
    });

    ApiService.deleteMethod(2108).then((value) {
      setState(() {
        res = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: isLoading
            ? Center(child: Image.asset("assets/images/loading.gif"))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(res),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       Employee xodim1 =
                  //           Employee(name: "Yulduz", salary: "1000\$", age: 16);
                  //       Map map = xodim1.toMap();
                  //       var uri = Uri.parse(
                  //           "https://dummy.restapiexample.com/api/v1/create");

                  //       var javob = await post(uri,
                  //           headers: {
                  //             "Content-type": "application/json; charset=UTF-8"
                  //           },
                  //           body: jsonEncode(map));

                  //       setState(() {
                  //         res = javob.body;
                  //       });
                  //     },
                  //     child: const Text("Javob olish"))
                ],
              ),
      ),
    );
  }
}
