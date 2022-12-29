import 'package:get/get.dart';
import 'package:my_expenses/app/data/data_sources/delete_expense_data_source.dart';
import 'package:my_expenses/app/data/data_sources/get_expenses_list_data_source.dart';
import 'package:my_expenses/app/data/data_sources/get_planned_expenses_list_data_source.dart';
import 'package:my_expenses/app/data/data_sources/local/delete_expense_local_data_source_imp.dart';
import 'package:my_expenses/app/data/data_sources/local/get_expenses_list_local_data_source_imp.dart';
import 'package:my_expenses/app/data/data_sources/local/get_planned_expenses_list_local_data_source_imp.dart';
import 'package:my_expenses/app/data/data_sources/local/save_expense_local_data_source_imp.dart';
import 'package:my_expenses/app/data/data_sources/local/save_planned_expenses_local_data_source_imp.dart';
import 'package:my_expenses/app/data/data_sources/local/update_expense_local_data_source_imp.dart';
import 'package:my_expenses/app/data/data_sources/save_expense_data_source.dart';
import 'package:my_expenses/app/data/data_sources/save_planned_expenses_data_source.dart';
import 'package:my_expenses/app/data/data_sources/update_expense_data_source.dart';
import 'package:my_expenses/app/data/repositories/delete_expense_repository_imp.dart';
import 'package:my_expenses/app/data/repositories/get_expenses_list_repository_imp.dart';
import 'package:my_expenses/app/data/repositories/get_planned_expenses_repository_imp.dart';
import 'package:my_expenses/app/data/repositories/save_expense_repository_imp.dart';
import 'package:my_expenses/app/data/repositories/save_planned_expenses_repository_imp.dart';
import 'package:my_expenses/app/data/repositories/update_expense_repository_imp.dart';
import 'package:my_expenses/app/domain/repositories/delete_expense_repository.dart';
import 'package:my_expenses/app/domain/repositories/get_expenses_list_repository.dart';
import 'package:my_expenses/app/domain/repositories/get_planned_expenses_list_repository.dart';
import 'package:my_expenses/app/domain/repositories/save_expense_repository.dart';
import 'package:my_expenses/app/domain/repositories/save_planned_expenses_repository.dart';
import 'package:my_expenses/app/domain/repositories/update_expense_repository.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_expense_usecase_imp.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase_imp.dart';
import 'package:my_expenses/app/domain/usecases/get_planned_expenses_usecase/get_planned_expenses_list_usecase.dart';
import 'package:my_expenses/app/domain/usecases/get_planned_expenses_usecase/get_planned_expenses_list_usecase_imp.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase_imp.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expenses_usecase_imp.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase_imp.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expenses_controller.dart';

import '../../../../core/data/services/databases/sqflite/get_data_base_sqlite_imp.dart';
import '../controllers/planned_expenses_controller.dart';

class PlannedExpensesBinding extends Bindings {
  @override
  void dependencies() {
    
    //controller
    Get.lazyPut<PlannedExpensesController>(
      () => PlannedExpensesController(),
    );
    Get.lazyPut<ExpensesController>(
      () => ExpensesController(),
    );

    //database
    Get.lazyPut<GetDataBaseSQLiteImp>(() => GetDataBaseSQLiteImp());

    //datasources
    Get.lazyPut<GetExpensesListByIdDataSource>(
      () => GetExpensesListByIdLocalDataSourceImp(Get.find()),
    );
    Get.lazyPut<GetPlannedExpensesListDataSource>(
      () => GetPlannedExpensesListLocalDataSourceImp(Get.find()),
    );
    Get.lazyPut<SaveExpenseDataSource>(
      () => SaveExpanseLocalDataSourceImp(Get.find()),
    );
    Get.lazyPut<SavePlannedExpensesDataSource>(
      () => SavePlannedExpenseLocalDataSourceImp(Get.find()),
    );
    Get.lazyPut<DeleteExpenseDataSource>(
      () => DeleteExpenseLocalDataSourceImp(Get.find()),
    );
    Get.lazyPut<UpdateExpenseDataSource>(
      () => UpdateExpenseLocalDataSourceImp(Get.find()),
    );

    //repositories
    Get.lazyPut<GetExpensesListByIdRepository>(
      () => GetExpensesListRepositoryByIdImp(Get.find()),
    );
    Get.lazyPut<GetPlannedExpensesListRepository>(
      () => GetPlannedExpensesListRepositoryImp(Get.find()),
    );
    Get.lazyPut<SaveExpenseRepository>(
      () => SaveExpenseRepositoryImp(Get.find()),
    );
    Get.lazyPut<SavePlannedExpensesRepository>(
      () => SavePlannedExpensesRepositoryImp(Get.find()),
    );
    Get.lazyPut<DeleteExpenseRepository>(
      () => DeleteExpenseRepositoryImp(Get.find()),
    );
    Get.lazyPut<UpdateExpenseRepository>(
      () => UpdateExpenseRepositoryImp(Get.find()),
    );

    //usecases
    Get.lazyPut<GetExpensesListByIdUsecase>(
      () => GetExpensesListByIdUsecaseImp(Get.find()),
    );
    Get.lazyPut<GetPlannedExpensesListUsecase>(
      () => GetPlannedExpensesListUsecaseImp(Get.find()),
    );
    Get.lazyPut<SaveExpenseUsecase>(
      () => SaveExpenseUsecaseImp(Get.find()),
    );
    Get.lazyPut<SavePlannedExpensesUseCase>(
      () => SavePlannedExpensesUseCaseImp(Get.find()),
    );
    Get.lazyPut<DeleteExpenseUsecase>(
      () => DeleteExpenseUsecaseImp(Get.find()),
    );
    Get.lazyPut<UpdateExpenseUsecase>(
      () => UpdateExpenseUsecaseImp(Get.find()),
    );
  }
}
