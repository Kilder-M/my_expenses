import 'package:get/get.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/views/expenses_view.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/views/planned_expenses_form_view.dart';

import '../presentation/modules/home/bindings/home_binding.dart';
import '../presentation/modules/home/views/home_view.dart';
import '../presentation/modules/planned_expenses/bindings/planned_expenses_binding.dart';
import '../presentation/modules/planned_expenses/views/planned_expenses_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.plannedExpenses,
      page: () => const PlannedExpensesView(),
      binding: PlannedExpensesBinding(),
    ),
     GetPage(
      name: _Paths.plannedExpensesForm,
      page: () => const PlannedExpensesFormView(),
      binding: PlannedExpensesBinding(),
    ),
    GetPage(
      name: _Paths.expenses,
      page: () => const ExpensesView(),
      binding: PlannedExpensesBinding(),
    ),
   
  ];
}
