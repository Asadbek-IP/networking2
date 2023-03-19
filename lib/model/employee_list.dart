import 'package:networking2/model/response_emp_single.dart';

class EmpolyeeList {
  String? status;
  List<EmployeeSingle>? employees;
  String? msg;

  EmpolyeeList(
      {required this.status, required this.employees, required this.msg});

  factory EmpolyeeList.fromJson(Map json) {
    return EmpolyeeList(
        status: json["status"],
        employees: List<EmployeeSingle>.from(
            json["data"].map((qiymat) => EmployeeSingle.fromJson(qiymat))),
        msg: json["message"]);
  }
}


