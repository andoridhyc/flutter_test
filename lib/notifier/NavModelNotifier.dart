import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomNotifier extends StateNotifier<int> {
  HomeBottomNotifier(super.state);

  void changeIndex(int index) {
    state = index;
  }
}

var curIndex = StateNotifierProvider<HomeBottomNotifier,int>((_) => HomeBottomNotifier(0));

