import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hy/page/home_nav_page.dart';
import 'package:hy/route/app_router.dart';
import 'package:hy/utlis/sp_utlils.dart';

import 'constant/constant.dart';
import 'generated/l10n.dart';

late StateProvider<Locale> localeProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SpUtlis.preInit();
  var spLocal = SpUtlis.getInstance()?.get<String>(locale);
  if (spLocal == 'zh') {
    localeProvider= StateProvider((_)=> Locale('zh'));
  }else{
    localeProvider= StateProvider((_)=> Locale('en'));
  }

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var local = ref.watch(localeProvider);
      return MaterialApp.router(
        onGenerateTitle: (context){
          // 此时context在Localizations的子树中
          return S.of(context).home ;
        },
        locale: local,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
          highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
        ),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,

      );
    });
  }

}

