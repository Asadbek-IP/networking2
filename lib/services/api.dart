import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:networking2/model/post.dart';

class ApiService {
  static String baseUrl = "https://dummy.restapiexample.com/api/v1";
  static Map<String, String> headerApi = {
    "Content-type": "application/json; charset=UTF-8"
  };

  static String getApi = "/employees";
  static String postApi = "/create";
  static String putApi = "/update/"; // id
  static String deleteApi = "/delete/"; // id

  static Future<String> getMethod() async {
    var uri = Uri.parse(baseUrl + getApi); // uri qismi
    var javob = await http.get(uri, headers: headerApi); // response
    return javob.body;
  }

  static Future<String> postMethod(Employee employee) async {
    var uri = Uri.parse(baseUrl + postApi); // uri qismi
    Map map = employee.toMap();
    String json = jsonEncode(map);

    var javob =
        await http.post(uri, headers: headerApi, body: json); // response

    return javob.body;
  }

  static Future<String> putMethod(Employee employee, int id) async {
    var uri = Uri.parse(baseUrl + putApi + id.toString()); // uri qismi

    var javob = await http.put(uri,
        headers: headerApi, body: jsonEncode(employee.toMap())); // response

    if (javob.statusCode == 200) {
      return javob.body;
    } else {
      return "Error";
    }
  }

  static Future<String> deleteMethod(int id) async {
    var uri = Uri.parse(baseUrl + deleteApi + id.toString()); // uri qismi

    var javob = await http.delete(
      uri,
    ); // response
    if (javob.statusCode == 200) {
      return javob.body;
    } else {
      return "error";
    }
  }
}
