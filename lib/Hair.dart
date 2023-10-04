class Hair {
  Hair({
       this.color,
       this.type,});

  Hair.fromJson(dynamic json) {
    color = json['color'];
    type = json['type'];
  }
  String? color;
  String ?type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    map['type'] = type;
    return map;
  }

}