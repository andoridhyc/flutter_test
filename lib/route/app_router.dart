// 封装的路由管理类
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hy/page/setting_page.dart';

import '../page/error_page.dart';
import '../page/home_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => const SettingPage(),
      ),

    ],
    errorBuilder: (context, state) => const ErrorPage(),
    initialExtra: 'extra',
  );

  // 获取路由实例
  static GoRouter get router => _router;

  // 路由跳转的封装
  static void goHome(BuildContext context) {
    context.go('/');
  }

  static void goSetting(BuildContext context) {
    context.push('/setting');
  }

  // 你可以在这里封装其他复杂的跳转逻辑，比如带参数的跳转
  static void goWithParams(BuildContext context, String param) {
    context.push('/details/$param');
  }
}