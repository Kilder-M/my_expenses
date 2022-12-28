import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  final double? width, height;
  final Color? backgroundColor;
  final IconData icon;
  final String cardName;
  final void Function()? onTap;

  const GridViewCard({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    required this.icon,
    required this.cardName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? 100,
        height: height ?? 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    icon,
                    size: 45,
                  ),
                  Text(
                    cardName,
                    style: const TextStyle(fontSize: 10),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}