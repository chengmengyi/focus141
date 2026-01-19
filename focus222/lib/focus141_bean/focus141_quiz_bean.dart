class Focus141QuizBean {
  Focus141QuizBean({
      this.question, 
      this.a, 
      this.b, 
      this.answer,});

  Focus141QuizBean.fromJson(dynamic json) {
    question = json['question'];
    a = json['a'];
    b = json['b'];
    answer = json['answer'];
  }
  String? question;
  String? a;
  String? b;
  String? answer;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    map['a'] = a;
    map['b'] = b;
    map['answer'] = answer;
    return map;
  }

}