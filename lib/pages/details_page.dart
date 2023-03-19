import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:networking2/model/employee_get.dart';
import 'package:networking2/model/response_emp_single.dart';
import 'package:networking2/model/single_employee_model.dart';
import 'package:networking2/services/api.dart';

class DetailsPage extends StatefulWidget {
  int id;

  DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  EmployeeSingle? xodim;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmpSingle();
  }

  void getEmpSingle() {
    setState(() {
      isLoading = true;
    });
    ApiService.getEmployeeSingle(widget.id).then((value) {
      setState(() {
        xodim = value;
        isLoading = false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${xodim!.employeeName}(${xodim!.employeeAge})"),
                  Text("${xodim!.employeeSalary}\$"),
                ],
              ),
      ),
    );
  }
}
