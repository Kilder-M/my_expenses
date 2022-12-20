import 'package:my_expenses/app/core/domain/services/database/get_data_base.dart';
import 'package:my_expenses/app/core/utils/sqflite_script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GetDataBaseImp extends GetDataBase {
  late Database _db;

  @override
  Future<Database> call() async {
    String path = join(await getDatabasesPath(), 'my_expenses');
    _db = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(createPlannedExpensesTable);
      db.execute(createExpenseTable);
    });
    return _db;
  }
}
