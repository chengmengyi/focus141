import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';
import 'package:spine_flutter/spine_flutter.dart';

enum NewUserDialogShowView{
  box,animator,result,
}

class Focus141NewUserDialogCon extends Focus141Con{
  var newUserAdd=Focus141ValueUtils.instance.getNewUserReward();
  NewUserDialogShowView newUserDialogShowView=NewUserDialogShowView.box;
  ShakeAnimationController shakeAnimationController=ShakeAnimationController();
  late SpineWidgetController spineWidgetController;

  @override
  void onInit() {
    super.onInit();
    spineWidgetController=SpineWidgetController(
      onInitialized: (controller) {
        // controller.skeleton.setToSetupPose();
        // controller.skeleton.updateWorldTransform();
        // controller.animationState.setAnimationByName(0, "open", true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    shakeAnimationController.start(shakeCount: 0);
  }

  clickBox()async{
    newUserDialogShowView=NewUserDialogShowView.animator;
    update(["box"]);
    spineWidgetController.animationState.setAnimationByName(0, "open", false);
    await Future.delayed(Duration(milliseconds: 3000));
    newUserDialogShowView=NewUserDialogShowView.result;
    update(["box","btn"]);
  }

  clickDouble(Function(double reard) callback){
    Focus141AdUtils.instance.showAdFocus141(
      result: (give){
        backFocus141();
        callback.call(mulDecimalFocus141(newUserAdd, 2));
      },
    );
  }

  clickSingle(Function(double reard) callback){
    Focus141AdUtils.instance.showAdFocus141(
      result: (give){
        backFocus141();
        callback.call(newUserAdd.toDouble());
      },
    );
  }
}