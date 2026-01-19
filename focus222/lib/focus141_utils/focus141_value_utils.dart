import 'dart:convert';
import 'dart:math';

import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_value_bean.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';

class Focus141ValueUtils{
  static final Focus141ValueUtils _focus141valueUtils=Focus141ValueUtils();
  static Focus141ValueUtils get instance => _focus141valueUtils;

  Focus141ValueBean? _valueBean;

  initValue(){
    try{
      _valueBean=Focus141ValueBean.fromJson(jsonDecode(Focus141LocalQuiz.localValueStrBase64.base64()));
    }catch(e){
      _valueBean=Focus141ValueBean.fromJson(jsonDecode(Focus141LocalQuiz.localValueStrBase64.base64()));
    }
  }

  double getQuizReward()=>_getReward(_valueBean?.quizPrize??[]);
  double getBoxReward()=>_getReward(_valueBean?.boxPrize??[]);

  List<int> getCashList()=>_valueBean?.qlandRange??[800, 1000, 1500, 2000];

  int getWheelAddNum(){
    var point = _valueBean?.wheel?.wheelPoint;
    var tiger20 = point?.point20??10;
    var tiger50 = point?.point50??70;
    var tiger80 = point?.point80??5;
    var tiger100 = point?.point100??1;
    var index = Random().nextInt(100);
    if(index<tiger20){
      return 20;
    }else if(index>=tiger20&&index<(tiger20+tiger50)){
      return 50;
    }else if(index>=(tiger20+tiger50)&&index<(tiger20+tiger50+tiger80)){
      return 80;
    }else if(index>=(tiger20+tiger50+tiger80)&&index<(tiger20+tiger50+tiger80+tiger100)){
      return 100;
    }else{
      return 20;
    }
  }

  int getCurrentQueueNum()=>_valueBean?.queueNumber?.current?.intCurrent??99;

  int getCurrentQueueReduce(){
    var list = _valueBean?.queueNumber?.current?.intCurrentDelete??[5,8];
    if(list.isEmpty){
      return 1;
    }
    if(list.length<2){
      return list.first;
    }
    final random = Random();
    return list.first + random.nextInt(list.last - list.first + 1);
  }

  int getAllQueueNum()=>_valueBean?.queueNumber?.all?.intAll??388;

  int getAllQueueReduce(){
    var list = _valueBean?.queueNumber?.all?.intAllDelete??[1,3];
    if(list.isEmpty){
      return 1;
    }
    if(list.length<2){
      return list.first;
    }
    final random = Random();
    return list.first + random.nextInt(list.last - list.first + 1);
  }

  int getQuiz50Login7TaskQuizTotalNum()=>_valueBean?.verifyTask?.quiz??50;

  int getQuiz50Login7TaskLoginTotalNum()=>_valueBean?.verifyTask?.login??7;

  TixianTask getFirstTixianTask(){
    try{
      return _valueBean?.tixianTask?.first??TixianTask(title: "quiz",data: 10);
    }catch(e){
      return TixianTask(title: "quiz",data: 10,id: 1);
    }
  }

  TixianTask? getTixianTaskById(int? id){
    var indexWhere = _valueBean?.tixianTask?.indexWhere((value)=>value.id==id)??-1;
    if(indexWhere>=0){
      return _valueBean?.tixianTask?[indexWhere];
    }
    return null;
  }

  //获取下一个任务
  TixianTask getNextTixianTask(int? taskId){
    var defaultTixianTask = TixianTask(title: "quiz",data: 10,id: 1);
    try{
      var list = _valueBean?.tixianTask??[];
      if(list.isEmpty){
        return defaultTixianTask;
      }
      var indexWhere = _valueBean?.tixianTask?.indexWhere((value)=>value.id==taskId)??-1;
      if(indexWhere<0){
        return defaultTixianTask;
      }
      if(indexWhere+1>list.length){
        return list.first;
      }
      return list[indexWhere+1];
    }catch(e){
      return defaultTixianTask;
    }
  }

  double _getReward(List<QuizPrize> list){
    if(list.isEmpty){
      return 0.0;
    }
    var last = list.last;
    var data = bFocus141Money.getData();
    if(data>=(last.endNumber??1000)){
      return _getRandomDouble(last.prize??[]);
    }
    for (var value in list) {
      if(data>=(value.firstNumber??0)&&data<(value.endNumber??0)){
        return _getRandomDouble(value.prize??[]);
      }
    }
    return 0.0;
  }

  double _getRandomDouble(List<int> list) {
    if(list.isEmpty){
      return 0.0;
    }
    if(list.length==1){
      return list.first.toDouble();
    }
    var min = list.first;
    var max = list.last;
    final random = Random();
    double value = min + random.nextDouble() * (max - min);
    return value.toStringAsFixed(2).toDouble();
  }
}