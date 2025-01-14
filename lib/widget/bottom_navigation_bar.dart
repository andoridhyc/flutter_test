import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/nav_model.dart';

class CustomBottomNavBar extends ConsumerWidget {
  final List<NavModel> bottomList;
  final currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar(
      {super.key,
      required this.bottomList,
      required this.currentIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: buildItems(),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  List<BottomNavigationBarItem> buildItems() {
    return bottomList
        .map((e) => BottomNavigationBarItem(
              icon: Icon(
                e.icon,
                size: 24,
              ),
              activeIcon: Icon(
                e.activeIcon,
                size: 24,
              ),
              label: e.title,
            ))
        .toList();
  }
}


