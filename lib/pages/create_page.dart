import 'package:flutter/material.dart';
import 'package:networking2/model/employee_get.dart';
import 'package:networking2/model/response_emp_single.dart';
import 'package:networking2/services/api.dart';

import '../model/create_emp_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _salaryC = TextEditingController();
  final TextEditingController _ageC = TextEditingController();

  ResEmpModel? yangiXodim;

  bool isLoading = false;

  void createEmp() {
    setState(() {
      isLoading = true;
    });
    String name = _nameC.text;
    String salary = _salaryC.text;
    String age = _ageC.text;

    Employee employee = Employee(name: name, salary: salary, age: age);

    ApiService.createEmployee(employee).then((value) {
      setState(() {
        yangiXodim = value;
        isLoading = false;
        print(value.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        createEmp();
                      },
                      child: const Text("Create Employee"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "${yangiXodim?.name ?? ""} ${yangiXodim?.salary ?? ""}  ${yangiXodim?.age ?? ""}")
                  ],
                ),
              ),
      ),
    );
  }
}
