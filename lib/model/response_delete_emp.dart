import 'dart:convert';

ResponseDeleteEmployee responseDeleteEmployeeFromJson(String str) => ResponseDeleteEmployee.fromJson(json.decode(str));

String responseDeleteEmployeeToJson(ResponseDeleteEmployee data) => json.encode(data.toJson());

class ResponseDeleteEmployee {
    ResponseDeleteEmployee({
        required this.status,
        required this.data,
        required this.message,
    });

    String status;
    String data;
    String message;

    factory ResponseDeleteEmployee.fromJson(Map<String, dynamic> json) => ResponseDeleteEmployee(
        status: json["status"],
        data: json["data"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "message": message,
    };
}