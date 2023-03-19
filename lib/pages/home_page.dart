import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../main.dart';
import '../model/employee_get.dart';
import '../model/response_emp_single.dart';
import '../services/api.dart';
import 'create_page.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Employee employee = Employee(name: "Yuluzcha", salary: "1000\$", age: "2");
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

    Employee employee = Employee(name: "Yuluzcha", salary: "1000\$", age: "2");
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreatePage()));
          },
          child: const Icon(Icons.add),
        ),
        body: isLoading
            ? Center(child: Image.asset("assets/images/loading.gif"))
            : ListView.builder(
                itemCount: ishchilar.length,
                itemBuilder: (context, index) =>
                    empListItem(ishchilar[index], context),
              ),
      );
    
  }
}
Widget empListItem(EmployeeSingle ishchi, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            id: ishchi.id!,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${ishchi.employeeName}(${ishchi.employeeAge})",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${ishchi.employeeSalary}\$",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Divider()
        ],
      ),
    ),
  );
}
