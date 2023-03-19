class CreateResEmpSingle {
  CreateResEmpSingle({
    required this.status,
    required this.data,
    required this.message,
  });
  late final String status;
  late final ResEmpModel data;
  late final String message;
  
  CreateResEmpSingle.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = ResEmpModel.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class ResEmpModel {
  ResEmpModel({
    required this.name,
    required this.salary,
    required this.age,
    required this.id,
  });
  late final String name;
  late final String salary;
  late final String age;
  late final int id;
  
  ResEmpModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    salary = json['salary'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['salary'] = salary;
    _data['age'] = age;
    _data['id'] = id;
    return _data;
  }
}