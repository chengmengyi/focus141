import 'dart:math';

import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_cash_money_list_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_queue_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_rank_list_bean.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141QueueDialogCon extends Focus141Con{
  Focus141CashMoneyListBean bean;

  Focus141CashQueueInfoBean? myQueueInfo;
  List<Focus141RankListBean> rankList=[];
  ScrollController scrollController=ScrollController();

  Focus141QueueDialogCon({
    required this.bean,
  });


  @override
  void onReady() {
    super.onReady();
    _initQueueList();
  }

  _initQueueList()async{
    myQueueInfo = await Focus141CashUtils.instance.queryMyQueueInfo(bean.focus141cashQueueInfoBean?.cashMoney, bean.focus141cashQueueInfoBean?.cashType);
    if(null==myQueueInfo){
      backFocus141();
      return;
    }
    var currentPro = myQueueInfo?.currentPro??99;
    var totalPro = myQueueInfo?.totalPro??300;
    var myRank = totalPro-currentPro;
    var myAccount = await Focus141CashUtils.instance.queryCashAccount(bean.focus141cashQueueInfoBean?.cashType);
    if(myAccount.isEmpty){
      myAccount="${randomTwoLetters()}**.com";
    }
    rankList.clear();
    while(rankList.length<totalPro-1){
      rankList.add(
        Focus141RankListBean(
          userId: Random().nextInt(1000),
          account: "${randomTwoLetters()}**.com",
          amount: Focus141ValueUtils.instance.getCashList().random(),
          isMe: false,
        ),
      );
    }
    var index=0;
    if(myRank>1){
      index=myRank-1;
    }
    rankList.insert(
      index,
      Focus141RankListBean(
        userId: Random().nextInt(1000),
        account: myAccount,
        amount: bean.focus141cashQueueInfoBean?.cashMoney,
        isMe: true,
      ),
    );
    update(["rank"]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo((31.h)*index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  int getMyRank(){
    var currentPro = myQueueInfo?.currentPro??99;
    var totalPro = myQueueInfo?.totalPro??300;
    var myRank = totalPro-currentPro;
    if(myRank<=1){
      return 1;
    }
    return myRank;
  }

  String randomTwoLetters() {
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final random = Random();
    return String.fromCharCodes(List.generate(2, (_) => letters.codeUnitAt(random.nextInt(letters.length)),));
  }

  clickSkip()async{
    Focus141AdUtils.instance.showAdFocus141(
      result: (give)async{
        if(give){
          await Focus141CashUtils.instance.updateQueueTaskProgress(bean.focus141cashQueueInfoBean);
          _initQueueList();
        }
      },
    );
  }

  clickClose(){
    backFocus141();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}