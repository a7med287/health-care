import 'package:flutter/material.dart';
import 'nav_item.dart';
import 'nav_button.dart';

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final List<NavItem> items;
  final ValueChanged<int> onItemSelected;

  const AnimatedBottomNav({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = width / items.length;

    return SizedBox(
      height: 86,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Container(
              height: 68,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 233, 237),
                borderRadius: BorderRadius.circular(34),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 12,
            right: 12,
            bottom: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                final selected = index == currentIndex;
                return NavButton(
                  item: items[index],
                  selected: selected,
                  width: itemWidth - 22,
                  onTap: () => onItemSelected(index),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
