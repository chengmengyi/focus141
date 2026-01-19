class Focus141CashQuiz20InfoBean {
  Focus141CashQuiz20InfoBean({
    this.quizNum,
    this.cashStep,
    this.cashType,
    this.cashMoney,
    this.totalQuizNum,
  });

  Focus141CashQuiz20InfoBean.fromJson(dynamic json) {
    quizNum = json['quizNum'];
    cashStep = json['cashStep'];
    cashType = json['cashType'];
    cashMoney = json['cashMoney'];
    totalQuizNum = json['totalQuizNum'];
  }
  int? quizNum;
  String? cashStep;
  String? cashType;
  int? cashMoney;
  int? totalQuizNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quizNum'] = quizNum;
    map['cashStep'] = cashStep;
    map['cashType'] = cashType;
    map['cashMoney'] = cashMoney;
    map['totalQuizNum'] = totalQuizNum;
    return map;
  }

}