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

class EmployeeSingle {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? employeeImage;

  EmployeeSingle({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.employeeImage,
  });

    factory EmployeeSingle.fromJson(Map<String, dynamic> json) {
    return EmployeeSingle(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        employeeImage: json["profile_image"]);
  }
}
