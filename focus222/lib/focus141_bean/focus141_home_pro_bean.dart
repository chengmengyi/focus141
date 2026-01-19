class Focus141HomeProType{
  static const String box="box";
  static const String wheel="wheel";
  static const String empty="empty";
}

class Focus141HomeProBean {
  Focus141HomeProBean({
      this.type, 
      this.step, 
      this.received,});

  Focus141HomeProBean.fromJson(dynamic json) {
    type = json['type'];
    step = json['step'];
    received = json['received'];
  }
  String? type;
  int? step;
  int? received;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['step'] = step;
    map['received'] = received;
    return map;
  }

  @override
  String toString() {
    return 'Focus141HomeProBean{type: $type, step: $step, received: $received}';
  }

}