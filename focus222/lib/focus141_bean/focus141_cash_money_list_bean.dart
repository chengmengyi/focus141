import 'package:focus222/focus141_bean/focus141_cash_loop_task_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_queue_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_quiz20_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_quiz50_login_info_bean.dart';

class Focus141CashMoneyListBean {
  int money;
  Focus141CashQuiz20InfoBean? focus141cashQuiz20InfoBean;
  Focus141CashQueueInfoBean? focus141cashQueueInfoBean;
  Focus141CashQuiz50LoginInfoBean? focus141cashQuiz50LoginInfoBean;
  Focus141CashLoopTaskInfoBean? focus141cashLoopTaskInfoBean;

  Focus141CashMoneyListBean({
    required this.money,
    this.focus141cashQuiz20InfoBean,
    this.focus141cashQueueInfoBean,
    this.focus141cashQuiz50LoginInfoBean,
    this.focus141cashLoopTaskInfoBean,
});
}