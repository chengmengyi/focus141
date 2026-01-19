import 'package:focus111/focus141_sql/focus141_sql_table_name.dart';
import 'package:sqflite/sqflite.dart';

class Focus141SqlUtils{
  static final Focus141SqlUtils _focus141sqlUtils=Focus141SqlUtils();
  static Focus141SqlUtils get instance => _focus141sqlUtils;


  Future<Database> initSql()async{
    var database = await openDatabase(
      "focus141.db",
      version: 1,
      onCreate: (db,version)async{
        _createVersion1DB(db);
      },
      // onUpgrade: (db,oldVersion,newVersion){
      //   if(newVersion==2){
      //     _createVersion2DB(db);
      //   }else if(newVersion==3){
      //     _createVersion3DB(db);
      //   }
      // },
    );
    return database;
  }

  _createVersion1DB(Database db){
    db.execute('CREATE TABLE ${Focus141SqlTableName.homeProgress} (id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT, step INTEGER, received INTEGER)');
    db.execute('CREATE TABLE ${Focus141SqlTableName.cashQuiz20Info} (id INTEGER PRIMARY KEY AUTOINCREMENT, cashType TEXT, cashMoney INTEGER, cashStep TEXT, quizNum INTEGER, totalQuizNum INTEGER)');
    db.execute('CREATE TABLE ${Focus141SqlTableName.cashQueueInfo} (id INTEGER PRIMARY KEY AUTOINCREMENT, cashType TEXT, cashMoney INTEGER, cashStep TEXT, currentPro INTEGER, totalPro INTEGER)');
    db.execute('CREATE TABLE ${Focus141SqlTableName.cashQuiz50AndLogin7Info} (id INTEGER PRIMARY KEY AUTOINCREMENT, cashType TEXT, cashMoney INTEGER, cashStep TEXT, quizNum INTEGER, loginNum INTEGER,quizTotalNum INTEGER,loginTotalNum INTEGER)');
    db.execute('CREATE TABLE ${Focus141SqlTableName.cashLoopTaskInfo} (id INTEGER PRIMARY KEY AUTOINCREMENT, cashType TEXT, cashMoney INTEGER, cashStep TEXT, currentPro INTEGER, totalPro INTEGER, taskId INTEGER)');
  }
}