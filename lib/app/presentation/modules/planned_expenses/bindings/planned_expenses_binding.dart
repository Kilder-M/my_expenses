import 'package:get/get.dart';

import '../controllers/planned_expenses_controller.dart';

class PlannedExpensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannedExpensesController>(
      () => PlannedExpensesController(),
    );
  }
}
