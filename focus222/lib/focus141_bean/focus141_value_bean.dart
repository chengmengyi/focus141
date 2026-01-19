class Focus141ValueBean {
  Focus141ValueBean({
    this.qlandRange,
    this.newPrize,
    this.queueNumber,
    this.verifyTask,
    this.intadPoint,
    this.rvadPoint,
    this.quizPrize,
    this.floatPrize,
    this.boxPrize,
    this.wheel,
    this.tixianTask,
  });

  Focus141ValueBean.fromJson(dynamic json) {
    qlandRange = json['qland_range'] != null ? json['qland_range'].cast<int>() : [];
    newPrize = json['new_prize'];
    queueNumber = json['queue_number'] != null ? QueueNumber.fromJson(json['queue_number']) : null;
    verifyTask = json['verify_task'] != null ? VerifyTask.fromJson(json['verify_task']) : null;
    if (json['tixian_task'] != null) {
      tixianTask = [];
      json['tixian_task'].forEach((v) {
        tixianTask?.add(TixianTask.fromJson(v));
      });
    }
    if (json['intad_point'] != null) {
      intadPoint = [];
      json['intad_point'].forEach((v) {
        intadPoint?.add(IntadPoint.fromJson(v));
      });
    }
    if (json['rvad_point'] != null) {
      rvadPoint = [];
      json['rvad_point'].forEach((v) {
        rvadPoint?.add(IntadPoint.fromJson(v));
      });
    }
    if (json['quiz_prize'] != null) {
      quizPrize = [];
      json['quiz_prize'].forEach((v) {
        quizPrize?.add(QuizPrize.fromJson(v));
      });
    }
    if (json['float_prize'] != null) {
      floatPrize = [];
      json['float_prize'].forEach((v) {
        floatPrize?.add(QuizPrize.fromJson(v));
      });
    }
    if (json['box_prize'] != null) {
      boxPrize = [];
      json['box_prize'].forEach((v) {
        boxPrize?.add(QuizPrize.fromJson(v));
      });
    }
    wheel = json['wheel'] != null ? Wheel.fromJson(json['wheel']) : null;
  }
  List<int>? qlandRange;
  int? newPrize;
  QueueNumber? queueNumber;
  List<IntadPoint>? intadPoint;
  List<IntadPoint>? rvadPoint;
  List<QuizPrize>? quizPrize;
  List<QuizPrize>? floatPrize;
  List<QuizPrize>? boxPrize;
  Wheel? wheel;
  VerifyTask? verifyTask;
  List<TixianTask>? tixianTask;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qland_range'] = qlandRange;
    map['new_prize'] = newPrize;
    if (queueNumber != null) {
      map['queue_number'] = queueNumber?.toJson();
    }
    if (verifyTask != null) {
      map['verify_task'] = verifyTask?.toJson();
    }
    if (tixianTask != null) {
      map['tixian_task'] = tixianTask?.map((v) => v.toJson()).toList();
    }
    if (intadPoint != null) {
      map['intad_point'] = intadPoint?.map((v) => v.toJson()).toList();
    }
    if (rvadPoint != null) {
      map['rvad_point'] = rvadPoint?.map((v) => v.toJson()).toList();
    }
    if (quizPrize != null) {
      map['quiz_prize'] = quizPrize?.map((v) => v.toJson()).toList();
    }
    if (floatPrize != null) {
      map['float_prize'] = floatPrize?.map((v) => v.toJson()).toList();
    }
    if (boxPrize != null) {
      map['box_prize'] = boxPrize?.map((v) => v.toJson()).toList();
    }
    if (wheel != null) {
      map['wheel'] = wheel?.toJson();
    }
    return map;
  }

}

class Wheel {
  Wheel({
      this.wheelPoint, 
      this.task, 
      this.checkPrize,});

  Wheel.fromJson(dynamic json) {
    wheelPoint = json['wheel_point'] != null ? WheelPoint.fromJson(json['wheel_point']) : null;
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
    if (json['check_prize'] != null) {
      checkPrize = [];
      json['check_prize'].forEach((v) {
        checkPrize?.add(CheckPrize.fromJson(v));
      });
    }
  }
  WheelPoint? wheelPoint;
  Task? task;
  List<CheckPrize>? checkPrize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (wheelPoint != null) {
      map['wheel_point'] = wheelPoint?.toJson();
    }
    if (task != null) {
      map['task'] = task?.toJson();
    }
    if (checkPrize != null) {
      map['check_prize'] = checkPrize?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CheckPrize {
  CheckPrize({
      this.firstNumber, 
      this.prize, 
      this.endNumber,});

  CheckPrize.fromJson(dynamic json) {
    firstNumber = json['first_number'];
    prize = json['prize'] != null ? json['prize'].cast<int>() : [];
    endNumber = json['end_number'];
  }
  int? firstNumber;
  List<int>? prize;
  int? endNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_number'] = firstNumber;
    map['prize'] = prize;
    map['end_number'] = endNumber;
    return map;
  }

}

class Task {
  Task({
      this.taskNumber,});

  Task.fromJson(dynamic json) {
    taskNumber = json['task_number'] != null ? TaskNumber.fromJson(json['task_number']) : null;
  }
  TaskNumber? taskNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (taskNumber != null) {
      map['task_number'] = taskNumber?.toJson();
    }
    return map;
  }

}

class TaskNumber {
  TaskNumber({
      this.video, 
      this.box, 
      this.wheel, 
      this.float,});

  TaskNumber.fromJson(dynamic json) {
    video = json['video'];
    box = json['box'];
    wheel = json['wheel'];
    float = json['float'];
  }
  int? video;
  int? box;
  int? wheel;
  int? float;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['video'] = video;
    map['box'] = box;
    map['wheel'] = wheel;
    map['float'] = float;
    return map;
  }

}

class WheelPoint {
  WheelPoint({
      this.point20, 
      this.point50, 
      this.point80, 
      this.point100, 
      this.iphonePoint,});

  WheelPoint.fromJson(dynamic json) {
    point20 = json['point20'];
    point50 = json['point50'];
    point80 = json['point80'];
    point100 = json['point100'];
    iphonePoint = json['iphone_point'];
  }
  int? point20;
  int? point50;
  int? point80;
  int? point100;
  int? iphonePoint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point20'] = point20;
    map['point50'] = point50;
    map['point80'] = point80;
    map['point100'] = point100;
    map['iphone_point'] = iphonePoint;
    return map;
  }

}

class QuizPrize {
  QuizPrize({
      this.firstNumber, 
      this.prize, 
      this.endNumber,});

  QuizPrize.fromJson(dynamic json) {
    firstNumber = json['first_number'];
    prize = json['prize'] != null ? json['prize'].cast<int>() : [];
    endNumber = json['end_number'];
  }
  int? firstNumber;
  List<int>? prize;
  int? endNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_number'] = firstNumber;
    map['prize'] = prize;
    map['end_number'] = endNumber;
    return map;
  }

}

class IntadPoint {
  IntadPoint({
      this.firstNumber, 
      this.number, 
      this.endNumber,});

  IntadPoint.fromJson(dynamic json) {
    firstNumber = json['first_number'];
    number = json['number'] != null ? json['number'].cast<int>() : [];
    endNumber = json['end_number'];
  }
  int? firstNumber;
  List<int>? number;
  int? endNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_number'] = firstNumber;
    map['number'] = number;
    map['end_number'] = endNumber;
    return map;
  }

}

class TixianTask {
  TixianTask({
      this.title, 
      this.data,
      this.id,
  });

  TixianTask.fromJson(dynamic json) {
    title = json['title'];
    data = json['data'];
    id = json['id'];
  }
  int? id;
  String? title;
  int? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['data'] = data;
    return map;
  }

}

class VerifyTask {
  VerifyTask({
    this.quiz,
    this.login,
  });

  VerifyTask.fromJson(dynamic json) {
    quiz = json['quiz'];
    login = json['login'];
  }
  int? quiz;
  int? login;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quiz'] = quiz;
    map['login'] = login;
    return map;
  }

}

class QueueNumber {
  QueueNumber({
    this.all,
    this.current,});

  QueueNumber.fromJson(dynamic json) {
    all = json['all'] != null ? All.fromJson(json['all']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  All? all;
  Current? current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (all != null) {
      map['all'] = all?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }

}

class Current {
  Current({
    this.intCurrent,
    this.intCurrentDelete,});

  Current.fromJson(dynamic json) {
    intCurrent = json['int_current'];
    intCurrentDelete = json['int_current_delete'] != null ? json['int_current_delete'].cast<int>() : [];
  }
  int? intCurrent;
  List<int>? intCurrentDelete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['int_current'] = intCurrent;
    map['int_current_delete'] = intCurrentDelete;
    return map;
  }

}

class All {
  All({
    this.intAll,
    this.intAllDelete,});

  All.fromJson(dynamic json) {
    intAll = json['int_all'];
    intAllDelete = json['int_all_delete'] != null ? json['int_all_delete'].cast<int>() : [];
  }
  int? intAll;
  List<int>? intAllDelete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['int_all'] = intAll;
    map['int_all_delete'] = intAllDelete;
    return map;
  }

}