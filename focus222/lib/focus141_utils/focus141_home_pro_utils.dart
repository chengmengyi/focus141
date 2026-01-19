import 'package:focus111/focus141_sql/focus141_sql_table_name.dart';
import 'package:focus111/focus141_sql/focus141_sql_utils.dart';
import 'package:focus222/focus141_bean/focus141_home_pro_bean.dart';

class Focus141HomeProUtils{
  static final Focus141HomeProUtils _focus141homeProUtils=Focus141HomeProUtils();
  static Focus141HomeProUtils get instance => _focus141homeProUtils;

  initProgress()async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.homeProgress);
    if(list.isNotEmpty){
      return;
    }
    var homeProList = _buildHomeProList();
    for (var value in homeProList) {
      await database.insert(Focus141SqlTableName.homeProgress, value.toJson());
    }
  }

  Future<List<Focus141HomeProBean>> getProList()async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.homeProgress);
    if(list.isEmpty){
      return [];
    }
    List<Focus141HomeProBean> result=[];
    for (var value in list) {
      result.add(Focus141HomeProBean.fromJson(value));
    }
    return result;
  }

  updateProgress(Focus141HomeProBean bean)async{
    var database = await Focus141SqlUtils.instance.initSql();
    bean.received=1;
    await database.update(Focus141SqlTableName.homeProgress,bean.toJson(),where: '"step" = ?',whereArgs: [bean.step]);
  }

  List<Focus141HomeProBean> _buildHomeProList({int length = 100}) {
    final List<Focus141HomeProBean> list = [];

    int boxCounter = 0; // 连续 box 计数

    for (int index = 0; index < length; index++) {
      String type = Focus141HomeProType.empty;
      final int step = index;

      // 是否是 box 出现点
      if (index >= 2 && (index - 2) % 3 == 0) {
        boxCounter++;

        // 第 3 个才是 wheel（前面已经有 2 个 box）
        if (boxCounter == 3) {
          type = Focus141HomeProType.wheel;
          boxCounter = 0; // 重置
        } else {
          type = Focus141HomeProType.box;
        }
      }

      list.add(
        Focus141HomeProBean(
          type: type,
          step: step,
          received: 0,
        ),
      );
    }

    return list;
  }
}