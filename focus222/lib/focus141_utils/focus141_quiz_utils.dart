import 'dart:convert';

import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_quiz_bean.dart';
import 'package:focus222/focus141_bean/focus141_quiz_type_bean.dart';

class Focus141QuizUtils{
  static final Focus141QuizUtils _focus141quizUtils=Focus141QuizUtils();
  static Focus141QuizUtils get instance => _focus141quizUtils;
  
  List<Focus141QuizTypeBean> initQuizList(){
    try{
      List<Focus141QuizTypeBean> result=[];

      List<Focus141QuizBean> mathList=[];
      for(var value in jsonDecode(Focus141LocalQuiz.math.base64())){
        mathList.add(Focus141QuizBean.fromJson(value));
      }
      result.add(Focus141QuizTypeBean(type: "MATH", size: mathList.length, list: mathList));

      List<Focus141QuizBean> animalList=[];
      for(var value in jsonDecode(Focus141LocalQuiz.animal.base64())){
        animalList.add(Focus141QuizBean.fromJson(value));
      }
      result.add(Focus141QuizTypeBean(type: "ANIMAL", size: animalList.length, list: animalList));

      List<Focus141QuizBean> natureList=[];
      for(var value in jsonDecode(Focus141LocalQuiz.nature.base64())){
        natureList.add(Focus141QuizBean.fromJson(value));
      }
      result.add(Focus141QuizTypeBean(type: "NATURE", size: natureList.length, list: natureList));

      List<Focus141QuizBean> scienceList=[];
      for(var value in jsonDecode(Focus141LocalQuiz.science.base64())){
        scienceList.add(Focus141QuizBean.fromJson(value));
      }
      result.add(Focus141QuizTypeBean(type: "SCIENCE", size: scienceList.length, list: scienceList));

      List<Focus141QuizBean> historyList=[];
      for(var value in jsonDecode(Focus141LocalQuiz.history.base64())){
        historyList.add(Focus141QuizBean.fromJson(value));
      }
      result.add(Focus141QuizTypeBean(type: "HISTORY", size: historyList.length, list: historyList));

      return result;
    }catch(e){
      return [];
    }
  }
}