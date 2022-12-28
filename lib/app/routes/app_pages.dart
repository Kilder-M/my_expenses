import 'package:get/get.dart';

import '../presentation/modules/home/bindings/home_binding.dart';
import '../presentation/modules/home/views/home_view.dart';
import '../presentation/modules/planned_expenses/bindings/planned_expenses_binding.dart';
import '../presentation/modules/planned_expenses/views/planned_expenses_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PLANNED_EXPENSES,
      page: () => PlannedExpensesView(),
      binding: PlannedExpensesBinding(),
    ),
  ];
}
