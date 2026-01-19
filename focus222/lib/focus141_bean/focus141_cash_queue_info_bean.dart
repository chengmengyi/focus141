class Focus141CashQueueInfoBean {
  Focus141CashQueueInfoBean({
    this.currentPro,
    this.cashStep,
    this.totalPro,
    this.cashType,
    this.cashMoney,
  });

  Focus141CashQueueInfoBean.fromJson(dynamic json) {
    currentPro = json['currentPro'];
    cashStep = json['cashStep'];
    totalPro = json['totalPro'];
    cashType = json['cashType'];
    cashMoney = json['cashMoney'];
  }
  int? currentPro;
  String? cashStep;
  int? totalPro;
  String? cashType;
  int? cashMoney;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPro'] = currentPro;
    map['cashStep'] = cashStep;
    map['totalPro'] = totalPro;
    map['cashType'] = cashType;
    map['cashMoney'] = cashMoney;
    return map;
  }

}