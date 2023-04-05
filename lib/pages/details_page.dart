import 'package:flutter/material.dart';
import 'package:networking2/model/employee_get.dart';
import 'package:networking2/model/res_update_employee.dart';
import 'package:networking2/model/response_emp_single.dart';
import 'package:networking2/services/api.dart';
import 'package:networking2/model/response_delete_emp.dart';

class DetailsPage extends StatefulWidget {
  int id;

  DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  EmployeeSingle? xodim;
  ResponseUpdateEmployee? updateEmployee;
  ResponseDeleteEmployee? delEmp;
  bool isLoading = false;
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _salaryC = TextEditingController();
  final TextEditingController _ageC = TextEditingController();

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

  void bottomSh() async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameC,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            TextField(
              controller: _salaryC,
              decoration: const InputDecoration(
                hintText: "Salary",
              ),
            ),
            TextField(
              controller: _ageC,
              decoration: const InputDecoration(
                hintText: "Age",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                updateEmp(
                    Employee(
                        name: _nameC.text,
                        salary: _salaryC.text,
                        age: _ageC.text),
                    widget.id);
              },
              child: const Text("Update Employee"),
            ),
          ],
        ),
      ),
    );
  }

  void updateEmp(Employee employee, int id) {
    setState(() {
      isLoading = true;
    });
    Navigator.pop(context);
    ApiService.updateEmployee(employee, id).then((value) {
      setState(() {
        updateEmployee = value;
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(updateEmployee!.message)));
    });
  }

  void deleteEmp() async {
    setState(() {
      isLoading = true;
    });
    ApiService.deleteEmployee(widget.id).then((value) {
      setState(() {
        delEmp = value;
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${delEmp!.message}"),
        ),
      );
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "${updateEmployee?.data.name ?? xodim!.employeeName}(${updateEmployee?.data.age ?? xodim!.employeeAge})"),
                  Text(
                      "${updateEmployee?.data.salary ?? xodim!.employeeSalary}\$"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            bottomSh();
                          },
                          child: const Text("Update")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          deleteEmp();
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                        child: const Text("Delete"),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
