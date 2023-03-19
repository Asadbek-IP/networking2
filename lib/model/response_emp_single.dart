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
      print(json["name"]);
    return EmployeeSingle(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        employeeImage: json["profile_image"]);
  }
}