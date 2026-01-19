class Focus141CashLoopTaskInfoBean {
  Focus141CashLoopTaskInfoBean({
    this.currentPro,
    this.cashStep,
    this.totalPro,
    this.taskId,
    this.cashType,
    this.cashMoney,
  });

  Focus141CashLoopTaskInfoBean.fromJson(dynamic json) {
    currentPro = json['currentPro'];
    cashStep = json['cashStep'];
    totalPro = json['totalPro'];
    taskId = json['taskId'];
    cashType = json['cashType'];
    cashMoney = json['cashMoney'];
  }
  String? cashType;
  int? cashMoney;
  String? cashStep;
  int? currentPro;
  int? totalPro;
  int? taskId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPro'] = currentPro;
    map['cashStep'] = cashStep;
    map['totalPro'] = totalPro;
    map['taskId'] = taskId;
    map['cashType'] = cashType;
    map['cashMoney'] = cashMoney;
    return map;
  }

}