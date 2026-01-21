import 'package:focus111/focus141_enum/focus141_cash_step_enum.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_sql/focus141_sql_table_name.dart';
import 'package:focus111/focus141_sql/focus141_sql_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_cash_loop_task_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_queue_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_quiz20_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_quiz50_login_info_bean.dart';
import 'package:focus222/focus141_dialog/focus141_ad_review_dialog/focus141_ad_review_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_ad_review_fail_dialog/focus141_ad_review_fail_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_input_account_dialog/focus141_input_account_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_reach_cash_money_dialog/focus141_reach_cash_money_dialog.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141CashUtils{
  static final Focus141CashUtils _focus141cashUtils=Focus141CashUtils();
  static Focus141CashUtils get instance => _focus141cashUtils;

  //到达提现门槛弹窗
  showReachCashMoneyDialog(int money,Focus141CashTypeEnum typeEnum){
    showDialogFocus141(
      child: Focus141ReachCashMoneyDialog(
        money: money,
        typeEnum: typeEnum,
        callback: (){
          showInputAccountDialog(money,typeEnum);
        },
      ),
    );
  }

  showInputAccountDialog(int money,Focus141CashTypeEnum typeEnum)async{
    var account = await queryCashAccount(typeEnum.name);
    if(account.isEmpty){
      showDialogFocus141(
        child: Focus141InputAccountDialog(
          money: money,
          typeEnum: typeEnum,
          callback: (){
            showAdReviewPendingDialog(money, typeEnum);
          },
        ),
      );
    }else{
      showAdReviewPendingDialog(money, typeEnum);
    }
  }

  //广告审核弹窗
  showAdReviewPendingDialog(int money,Focus141CashTypeEnum typeEnum){
    showDialogFocus141(
      child: Focus141AdReviewDialog(
        money: money,
        typeEnum: typeEnum,
        callback: (){
          showAdReviewFailDialog(money,typeEnum);
        },
      ),
    );
  }

  //广告审核失败弹窗
  showAdReviewFailDialog(int money,Focus141CashTypeEnum typeEnum){
    showDialogFocus141(
      child: Focus141AdReviewFailDialog(
        money: money,
        typeEnum: typeEnum,
        callback: ()async{
          await insertQuiz20CashInfo(money, typeEnum);
        },
      ),
    );
  }

  //创建20个答题的提现任务
  insertQuiz20CashInfo(int money,Focus141CashTypeEnum typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQuiz20Info,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum.name,money]);
    if(list.isNotEmpty){
      return;
    }
    var focus141cashInfoBean = Focus141CashQuiz20InfoBean(
      cashType: typeEnum.name,
      cashMoney: money,
      cashStep: Focus141CashStepEnum.quiz20.name,
      quizNum: 0,
      totalQuizNum: 20,
    );
    await database.insert(Focus141SqlTableName.cashQuiz20Info, focus141cashInfoBean.toJson());
    Focus141InfoUtils.instance.updateMoney(-money);
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateCashInfo,);
  }

  //创建排队提现任务信息
  insertQueueCashInfo(int money,String typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQueueInfo,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum,money]);
    if(list.isNotEmpty){
      return;
    }
    var focus141cashQueueInfoBean = Focus141CashQueueInfoBean(
      cashType: typeEnum,
      cashMoney: money,
      cashStep: Focus141CashStepEnum.queue.name,
      currentPro: Focus141ValueUtils.instance.getCurrentQueueNum(),
      totalPro: Focus141ValueUtils.instance.getAllQueueNum(),
    );
    await database.insert(Focus141SqlTableName.cashQueueInfo, focus141cashQueueInfoBean.toJson());
  }

  //创建答题50登录7天提现任务信息
  insertQuiz50Login7CashInfo(int money,String typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQuiz50AndLogin7Info,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum,money]);
    if(list.isNotEmpty){
      return;
    }
    var focus141cashQuiz50LoginInfoBean = Focus141CashQuiz50LoginInfoBean(
      cashType: typeEnum,
      cashMoney: money,
      cashStep: Focus141CashStepEnum.queue.name,
      quizNum: 0,
      quizTotalNum: Focus141ValueUtils.instance.getQuiz50Login7TaskQuizTotalNum(),
      loginNum: 0,
      loginTotalNum: Focus141ValueUtils.instance.getQuiz50Login7TaskLoginTotalNum(),
    );
    await database.insert(Focus141SqlTableName.cashQuiz50AndLogin7Info, focus141cashQuiz50LoginInfoBean.toJson());
  }

  insertLoopTaskCashInfo(int money,String typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashLoopTaskInfo,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum,money]);
    if(list.isNotEmpty){
      return;
    }
    var tixianTask = Focus141ValueUtils.instance.getFirstTixianTask();
    var focus141cashLoopTaskInfoBean = Focus141CashLoopTaskInfoBean(
      cashType: typeEnum,
      cashMoney: money,
      cashStep: Focus141CashStepEnum.queue.name,
      currentPro: 0,
      totalPro: tixianTask.data,
      taskId: tixianTask.id,
    );
    await database.insert(Focus141SqlTableName.cashLoopTaskInfo, focus141cashLoopTaskInfoBean.toJson());
  }

  Future<Focus141CashQuiz20InfoBean?> queryCashQuiz20Info(int money,Focus141CashTypeEnum typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQuiz20Info,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum.name,money]);
    if(list.isEmpty){
      return null;
    }
    return Focus141CashQuiz20InfoBean.fromJson(list.first);
  }

  Future<Focus141CashQueueInfoBean?> queryCashQueueInfo(int money,Focus141CashTypeEnum typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQueueInfo,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum.name,money]);
    if(list.isEmpty){
      return null;
    }
    return Focus141CashQueueInfoBean.fromJson(list.first);
  }

  Future<Focus141CashQuiz50LoginInfoBean?> queryCashQuiz50AndLoginInfo(int money,Focus141CashTypeEnum typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQuiz50AndLogin7Info,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum.name,money]);
    if(list.isEmpty){
      return null;
    }
    return Focus141CashQuiz50LoginInfoBean.fromJson(list.first);
  }

  Future<Focus141CashLoopTaskInfoBean?> queryCashLoopTaskInfo(int money,Focus141CashTypeEnum typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashLoopTaskInfo,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [typeEnum.name,money]);
    if(list.isEmpty){
      return null;
    }
    return Focus141CashLoopTaskInfoBean.fromJson(list.first);
  }

  //更新答题任务进度
  updateQuizTaskProgress()async{
    var database = await Focus141SqlUtils.instance.initSql();
    //先更新20到题的
    var quiz20List = await database.query(Focus141SqlTableName.cashQuiz20Info);
    if(quiz20List.isNotEmpty){
      for (var value in quiz20List) {
        var id = value["id"];
        var focus141cashQuiz20InfoBean = Focus141CashQuiz20InfoBean.fromJson(value);
        focus141cashQuiz20InfoBean.quizNum=(focus141cashQuiz20InfoBean.quizNum??0)+1;
        //题答完了，任务更新为排队，这条记录删除
        if((focus141cashQuiz20InfoBean.quizNum??0)>=(focus141cashQuiz20InfoBean.totalQuizNum??0)){
          await database.delete(Focus141SqlTableName.cashQuiz20Info,where: '"id" = ? ',whereArgs: [id]);
          await insertQueueCashInfo(focus141cashQuiz20InfoBean.cashMoney??0,focus141cashQuiz20InfoBean.cashType??"");
        }else{ //没有完成任务，增加进度
          await database.update(Focus141SqlTableName.cashQuiz20Info, focus141cashQuiz20InfoBean.toJson(),where: '"id" = ? ',whereArgs: [id]);
        }
      }
    }
    //再更新50道题7天登录的
    var quiz50Login7List = await database.query(Focus141SqlTableName.cashQuiz50AndLogin7Info);
    for (var value in quiz50Login7List) {
      var focus141cashQuiz50LoginInfoBean = Focus141CashQuiz50LoginInfoBean.fromJson(value);
      if((focus141cashQuiz50LoginInfoBean.quizNum??0)<(focus141cashQuiz50LoginInfoBean.quizTotalNum??0)){
        focus141cashQuiz50LoginInfoBean.quizNum=(focus141cashQuiz50LoginInfoBean.quizNum??0)+1;
        //登录7天够了,答题够了，删除这条记录，任务更新为循环任务
        if((focus141cashQuiz50LoginInfoBean.loginNum??0)>=(focus141cashQuiz50LoginInfoBean.loginTotalNum??0)&&(focus141cashQuiz50LoginInfoBean.quizNum??0)>=(focus141cashQuiz50LoginInfoBean.quizTotalNum??0)){
          await database.delete(Focus141SqlTableName.cashQuiz50AndLogin7Info,where: '"id" = ? ',whereArgs: [value["id"]]);
          await insertLoopTaskCashInfo(focus141cashQuiz50LoginInfoBean.cashMoney??0,focus141cashQuiz50LoginInfoBean.cashType??"");
        }else{
          await database.update(Focus141SqlTableName.cashQuiz50AndLogin7Info, focus141cashQuiz50LoginInfoBean.toJson(),where: '"id" = ? ',whereArgs: [value["id"]]);
        }
      }
    }
    //再更新循环任务
    await updateLoopTask(taskType: Focus141LoopTaskTypeEnum.quiz,sendEventMsg: false);
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateCashInfo,);
  }

  updateQueueTaskProgress(Focus141CashQueueInfoBean? bean)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQueueInfo,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [bean?.cashType,bean?.cashMoney]);
    if(list.isEmpty){
      return;
    }
    var id = list.first["id"];
    var focus141cashQueueInfoBean = Focus141CashQueueInfoBean.fromJson(list.first);
    focus141cashQueueInfoBean.currentPro=(focus141cashQueueInfoBean.currentPro??0)+Focus141ValueUtils.instance.getCurrentQueueReduce();
    focus141cashQueueInfoBean.totalPro=(focus141cashQueueInfoBean.totalPro??0)-Focus141ValueUtils.instance.getAllQueueReduce();
    //排队任务完成了，任务更新为答题50道和登录7天，这条记录删除
    if((focus141cashQueueInfoBean.currentPro??0)>=(focus141cashQueueInfoBean.totalPro??0)){
      await database.delete(Focus141SqlTableName.cashQueueInfo,where: '"id" = ? ',whereArgs: [id]);
      await insertQuiz50Login7CashInfo(focus141cashQueueInfoBean.cashMoney??0,focus141cashQueueInfoBean.cashType??"");
    }else{ //没有完成任务，增加进度
      await database.update(Focus141SqlTableName.cashQueueInfo, focus141cashQueueInfoBean.toJson(),where: '"id" = ? ',whereArgs: [id]);
    }
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateCashInfo,);
  }

  updateLogin7TaskProgress()async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQuiz50AndLogin7Info);
    for (var value in list) {
      var focus141cashQuiz50LoginInfoBean = Focus141CashQuiz50LoginInfoBean.fromJson(value);
      if((focus141cashQuiz50LoginInfoBean.loginNum??0)<(focus141cashQuiz50LoginInfoBean.loginTotalNum??0)){
        focus141cashQuiz50LoginInfoBean.loginNum=(focus141cashQuiz50LoginInfoBean.loginNum??0)+1;
        //登录7天够了,答题够了，删除这条记录，任务更新为循环任务
        if((focus141cashQuiz50LoginInfoBean.loginNum??0)>=(focus141cashQuiz50LoginInfoBean.loginTotalNum??0)&&(focus141cashQuiz50LoginInfoBean.quizNum??0)>=(focus141cashQuiz50LoginInfoBean.quizTotalNum??0)){
          await database.delete(Focus141SqlTableName.cashQuiz50AndLogin7Info,where: '"id" = ? ',whereArgs: [value["id"]]);
          await insertLoopTaskCashInfo(focus141cashQuiz50LoginInfoBean.cashMoney??0,focus141cashQuiz50LoginInfoBean.cashType??"");
        }else{
          await database.update(Focus141SqlTableName.cashQuiz50AndLogin7Info, focus141cashQuiz50LoginInfoBean.toJson(),where: '"id" = ? ',whereArgs: [value["id"]]);
        }
      }
    }
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateCashInfo,);
  }

  //更新循环任务
  updateLoopTask({
    required Focus141LoopTaskTypeEnum taskType,
    bool sendEventMsg=true,
  })async{
    var database = await Focus141SqlUtils.instance.initSql();
    var loopTaskList = await database.query(Focus141SqlTableName.cashLoopTaskInfo);
    for (var value in loopTaskList) {
      var focus141cashLoopTaskInfoBean = Focus141CashLoopTaskInfoBean.fromJson(value);
      var tixianTaskById = Focus141ValueUtils.instance.getTixianTaskById(focus141cashLoopTaskInfoBean.taskId);
      if(tixianTaskById?.title!=taskType.name){
        continue;
      }
      focus141cashLoopTaskInfoBean.currentPro=(focus141cashLoopTaskInfoBean.currentPro??0)+1;
      if((focus141cashLoopTaskInfoBean.currentPro??0)>=(focus141cashLoopTaskInfoBean.totalPro??0)){
        var nextTixianTask = Focus141ValueUtils.instance.getNextTixianTask(focus141cashLoopTaskInfoBean.taskId);
        focus141cashLoopTaskInfoBean.currentPro=0;
        focus141cashLoopTaskInfoBean.totalPro=nextTixianTask.data;
        focus141cashLoopTaskInfoBean.taskId=nextTixianTask.id;
      }
      await database.update(Focus141SqlTableName.cashLoopTaskInfo, focus141cashLoopTaskInfoBean.toJson(),where: '"id" = ? ',whereArgs: [value["id"]]);
    }
    if(sendEventMsg){
      Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateCashInfo,);
    }
  }

  Future<Focus141CashQueueInfoBean?> queryMyQueueInfo(int? cashMoney,String? cashType)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashQueueInfo,where: '"cashType" = ? AND "cashMoney" = ?',whereArgs: [cashType,cashMoney]);
    if(list.isEmpty){
      return null;
    }
    return Focus141CashQueueInfoBean.fromJson(list.first);
  }

  saveCashAccount(Focus141CashTypeEnum typeEnum,String account)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashAccountInfo,where: '"cashType" = ? ',whereArgs: [typeEnum.name]);
    if(list.isNotEmpty){
      return;
    }
    await database.insert(Focus141SqlTableName.cashAccountInfo, {"cashType":typeEnum.name,"cashAccount":account});
  }

  Future<String> queryCashAccount(String? typeEnum)async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.cashAccountInfo,where: '"cashType" = ? ',whereArgs: [typeEnum]);
    if(list.isEmpty){
      return "";
    }
    return list.first["cashAccount"] as String;
  }
}