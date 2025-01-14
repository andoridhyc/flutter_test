import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomNotifier extends StateNotifier<int> {
  HomeBottomNotifier(super.state);

  void changeIndex(int index) {
    state = index;
  }
}

final homeBottomIndex = FutureProvider<HomeBottomNotifier>((ref) async {
  //从sp中获取 获取上次打开的页面下标
  return HomeBottomNotifier(0);
});


