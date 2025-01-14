import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hy/widget/keep_alive_wrapper.dart';

import '../model/nav_model.dart';
import '../widget/bottom_navigation_bar.dart';
import 'HomePage.dart';

var curIndex = StateProvider((_) => 0);

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({super.key});

  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  List<NavModel> bottomTabs = [];

  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    //进行配置读取，读取bottom
    bottomTabs.add(NavModel(
        title: "首页",
        icon: Icons.home,
        activeIcon: Icons.home_work_rounded,
        widget: HomePage()));
    bottomTabs.add(NavModel(
        title: "圈子",
        icon: Icons.sentiment_neutral,
        activeIcon: Icons.sentiment_very_satisfied_outlined,
        widget: HomePage()));
    bottomTabs.add(NavModel(
        title: "消息",
        icon: Icons.notification_add_outlined,
        activeIcon: Icons.notification_add,
        widget: HomePage()));
    bottomTabs.add(NavModel(
        title: "我的",
        icon: Icons.person_outline,
        activeIcon: Icons.person,
        widget: HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: PageView.builder(
          itemBuilder: (context, index) {
            var page = bottomTabs[index];
            return KeepAliveWrapper(child: page.widget);
          },
          itemCount: bottomTabs.length,
          controller: _controller,
          onPageChanged: (index) {
            ref.read(curIndex.notifier).state = index;
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: ref.watch(curIndex),
          onTap: (index) {
            ref.read(curIndex.notifier).state = index;
            _controller.jumpToPage(index);
          },
          bottomList: bottomTabs,
        ),
      );
    });
  }
}
