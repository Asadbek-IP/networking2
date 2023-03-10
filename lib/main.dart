import 'package:flutter/material.dart';
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
    //postApi();
    //putApi();
    deleteApi();
    super.initState();
  }

  void getApi() {
    setState(() {
      isLoading = true;
    });
    ApiService.getMethod().then((value) {
      setState(() {
        res = value;
        isLoading = false;
      });
    });
  }

  void postApi() {
    setState(() {
      isLoading = true;
    });

    Post post = Post(title: "Atham", body: "Flutter kursi", id: 123);
    ApiService.postMethod(post).then((value) {
      setState(() {
        res = value;
        isLoading = false;
      });
    });
  }

  void putApi() {
    setState(() {
      isLoading = true;
    });

    Post post = Post(title: "Bekzod", body: "Flutter kursi", id: 123);
    ApiService.putMethod(post, 2).then((value) {
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

    ApiService.deleteMethod(2).then((value) {
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
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(res),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Javobni olish"))
                ],
              ),
      ),
    );
  }
}
