import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/planned_expenses_controller.dart';

class PlannedExpensesView extends GetView<PlannedExpensesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlannedExpensesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlannedExpensesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
