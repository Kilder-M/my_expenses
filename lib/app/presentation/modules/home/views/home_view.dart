import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/presentation/widgets/grid_view_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewTitle(),
              toolsSubtitle(),
              gridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }

  Widget toolsSubtitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        'Ferramentas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget gridView() {
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
          children: gridViewCardList(),
        ),
      ),
    );
  }

  List<Widget> gridViewCardList() {
    return  [
      GestureDetector(
        onTap: (){},
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

  Widget viewTitle() {
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
