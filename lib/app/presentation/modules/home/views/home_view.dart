import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/presentation/widgets/grid_view_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: _BottomNavigationBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ViewTitle(),
              _ToolsSubtitle(),
              _GridView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
    );
  }
}

class _ToolsSubtitle extends StatelessWidget {
  const _ToolsSubtitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Text(
        AppLocalizations.of(context)!.tools,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ViewTitle extends StatelessWidget {
  const _ViewTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.manage_your,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.finances,
            style: const TextStyle(
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

class _GridView extends StatelessWidget {
  const _GridView();

  @override
  Widget build(BuildContext context) {
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
          children: _gridViewCardList(context),
        ),
      ),
    );
  }

  List<Widget> _gridViewCardList(BuildContext context) {
    return [
      GestureDetector(
        child: GridViewCard(
          icon: Icons.calendar_month_outlined,
          cardName: AppLocalizations.of(context)!.monthly_expenses,
          onTap: () {
            Get.toNamed('planned-expenses');
          },
        ),
      ),
    ];
  }
}
