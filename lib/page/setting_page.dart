import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/l10n.dart';
import '../main.dart';
import '../utlis/ext_compoent.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  var localList = S.delegate.supportedLocales;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Text(S.of(context).login),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          var selectedIndex = await showModalBottomSheetDialog<int>(context, (_) {
            return Container(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              //设置高度自适应
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("更改语言"),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap:true,
                      itemCount: localList.length,
                      itemBuilder: (context, index) {
                        String languageCode = localList[index].languageCode ?? '-';
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context, index);
                          },
                          child:  Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(languageCode),
                                Icon(
                                  Icons.chevron_right,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          });
          if (selectedIndex != null) {
            final localeNotifier = ref.read(localeProvider.notifier);
            final selectedLocale = localList[selectedIndex];
            localeNotifier.state = selectedLocale;
            S.load(selectedLocale);
          }
        }),
      );
    });
  }
}
