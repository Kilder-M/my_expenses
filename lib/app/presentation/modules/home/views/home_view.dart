import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/presentation/widgets/grid_view_card_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _viewTitle(),
              _toolsSubtitle(),
              _gridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }

  Widget _toolsSubtitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Text(
        'Ferramentas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _gridView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 110,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          children: _gridViewCardList(),
        ),
      ),
    );
  }

  List<Widget> _gridViewCardList() {
    return [
      GestureDetector(
        onTap: () {
          Get.toNamed('planned-expenses');
        },
        child: const GridViewCard(
          icon: Icons.calendar_month_outlined,
          cardName: 'Gastos Mensais',
        ),
      ),
      const GridViewCard(
        icon: Icons.savings_outlined,
        cardName: 'Gastos Essenciais',
      ),
      const GridViewCard(
        icon: Icons.emergency_outlined,
        cardName: 'Reserva de Emergência',
      ),
      const GridViewCard(
        icon: Icons.question_mark_outlined,
        cardName: 'Example',
      ),
      const GridViewCard(
        icon: Icons.question_mark_outlined,
        cardName: 'Example',
      ),
      const GridViewCard(
        icon: Icons.question_mark_outlined,
        cardName: 'Example',
      ),
      const GridViewCard(
        icon: Icons.question_mark_outlined,
        cardName: 'Example',
      ),
    ];
  }

  Widget _viewTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Organize suas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            'Finanças',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
