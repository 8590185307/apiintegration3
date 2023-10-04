import 'Address.dart';
import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));
String companyToJson(Company data) => json.encode(data.toJson());
class Company {
  Company({
      this.address, 
      this.department, 
      this.name, 
      this.title,});

  Company.fromJson(dynamic json) {
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    department = json['department'];
    name = json['name'];
    title = json['title'];
  }
  Address? address;
  String? department;
  String? name;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['department'] = department;
    map['name'] = name;
    map['title'] = title;
    return map;
  }

}