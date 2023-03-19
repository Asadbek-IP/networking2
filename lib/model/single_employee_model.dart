import 'package:networking2/model/response_emp_single.dart';

class EmpSingle {
  String? status;
  EmployeeSingle? employee;
  String? msg;

  EmpSingle({required this.status, required this.employee, required this.msg});
  factory EmpSingle.fromJson(Map json) {
    return EmpSingle(
        status: json["status"],
        employee: EmployeeSingle.fromJson(json["data"]),
        msg: json["message"]);
  }
}
