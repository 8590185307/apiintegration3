import 'Users.dart';
import 'dart:convert';

RespMain respMainFromJson(String str) => RespMain.fromJson(json.decode(str));
String respMainToJson(RespMain data) => json.encode(data.toJson());
class RespMain {
  RespMain({
      this.users, 
      this.total, 
      this.skip, 
      this.limit,});

  RespMain.fromJson(dynamic json) {
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Users>? users;
  num? total;
  num? skip;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}