import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../route/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('_HomePageState build');
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(S.of(context).home),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.goSetting(context);
        },
      ),
    );
  }
}
