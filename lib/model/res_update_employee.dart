import 'dart:convert';

ResponseUpdateEmployee responseUpdateEmployeeFromJson(String str) => ResponseUpdateEmployee.fromJson(json.decode(str));

String responseUpdateEmployeeToJson(ResponseUpdateEmployee data) => json.encode(data.toJson());

class ResponseUpdateEmployee {
    ResponseUpdateEmployee({
        required this.status,
        required this.data,
        required this.message,
    });

    String status;
    Data data;
    String message;

    factory ResponseUpdateEmployee.fromJson(Map<String, dynamic> json) => ResponseUpdateEmployee(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.name,
        required this.salary,
        required this.age,
    });

    String name;
    String salary;
    String age;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        salary: json["salary"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "salary": salary,
        "age": age,
    };
}