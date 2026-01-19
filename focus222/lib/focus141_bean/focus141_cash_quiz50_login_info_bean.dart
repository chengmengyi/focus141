class Focus141CashQuiz50LoginInfoBean {
  Focus141CashQuiz50LoginInfoBean({
    this.quizNum,
    this.cashStep,
    this.loginNum,
    this.cashType,
    this.cashMoney,
    this.quizTotalNum,
    this.loginTotalNum,
  });

  Focus141CashQuiz50LoginInfoBean.fromJson(dynamic json) {
    quizNum = json['quizNum'];
    cashStep = json['cashStep'];
    loginNum = json['loginNum'];
    cashType = json['cashType'];
    cashMoney = json['cashMoney'];
    quizTotalNum = json['quizTotalNum'];
    loginTotalNum = json['loginTotalNum'];
  }
  String? cashType;
  int? cashMoney;
  String? cashStep;
  int? quizNum;
  int? quizTotalNum;
  int? loginNum;
  int? loginTotalNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quizNum'] = quizNum;
    map['cashStep'] = cashStep;
    map['loginNum'] = loginNum;
    map['cashType'] = cashType;
    map['cashMoney'] = cashMoney;
    map['quizTotalNum'] = quizTotalNum;
    map['loginTotalNum'] = loginTotalNum;
    return map;
  }

}