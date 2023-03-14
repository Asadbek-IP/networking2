class Employee {
  String name;
  String salary;
  int age;

  Employee({required this.name, required this.salary, required this.age});

  Map toMap() {
    return {"name": name, "salary": salary, "age": age};
  }
}
