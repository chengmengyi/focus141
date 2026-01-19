class Focus141CashInfoBean {
  Focus141CashInfoBean({
      this.cashType, 
      this.cashMoney, 

  });

  Focus141CashInfoBean.fromJson(dynamic json) {
    cashType = json['cashType'];
    cashMoney = json['cashMoney'];
  }
  String? cashType;
  int? cashMoney;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashType'] = cashType;
    map['cashMoney'] = cashMoney;

    return map;
  }

}