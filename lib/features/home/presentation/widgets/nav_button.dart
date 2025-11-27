import 'package:flutter/material.dart';
import 'package:health_care/features/home/presentation/widgets/nav_item.dart';

class NavButton extends StatelessWidget {
  final NavItem item;
  final bool selected;
  final double width;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.item,
    required this.selected,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Theme.of(context).primaryColor : Colors.grey[600];
    return SizedBox(
      width: width,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, selected ? -6 : 0, 0),
              child: Icon(item.icon, size: 24, color: color),
            ),
            const SizedBox(height: 6),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: color,
                fontSize: selected ? 12 : 11,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}
