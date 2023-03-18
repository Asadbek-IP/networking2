
import 'package:flutter/material.dart';
import 'package:networking2/model/employee_list.dart';
import 'package:networking2/services/api.dart';

import 'model/employee_get.dart';

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
    //deleteApi();
    getEmpList();
    super.initState();
  }

  List<EmployeeSingle> ishchilar = [];

  void getEmpList() async {
    setState(() {
      isLoading = true;
    });
    ApiService.getEmployeeList().then((value) {
      setState(() {
        ishchilar = value!;
        isLoading = false;
      });
    });
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
            : ListView.builder(
                itemCount: ishchilar.length,
                itemBuilder: (context, index) => empListItem(ishchilar[index],context),
              ),
      ),
    );
  }
}

Widget empListItem(EmployeeSingle ishchi,BuildContext context) {
  return InkWell(
    onTap: (){
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(ishchi.id)));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${ishchi.employeeName}(${ishchi.employeeAge})",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${ishchi.employeeSalary}\$",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Divider()
        ],
      ),
    ),
  );
}
