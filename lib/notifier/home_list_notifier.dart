
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hy/model/home_model.dart';

class HomeListNotifier extends StateNotifier<AsyncValue<List<HomeModel>>> {
  HomeListNotifier(super.state);

  // // 初始化数据
  void loadItems() async{
    final String jsonStr = await rootBundle.loadString("assets/home_list.json");
    List<HomeModel> list = [];
    json.decode(jsonStr).forEach((element) {
      HomeModel plan = HomeModel.fromJson(element);
      list.add(plan);
    });
    state = AsyncData(list);
  }

  void onLoading() async{
    final String jsonStr = await rootBundle.loadString("assets/home_list.json");
    List<HomeModel> list = [];
    json.decode(jsonStr).forEach((element) {
      HomeModel plan = HomeModel.fromJson(element);
      list.add(plan);
    });
    final currentList = state.value ?? [];
    state = AsyncData([
      ...currentList,
      ...list
    ]);
  }

  Future<void> refreshItem(int index, HomeModel newItem) async {
    try {
      final currentList = state.value ?? [];
      currentList[index] = newItem;
      state = AsyncValue.data([...currentList]);
    } catch (e) {
      state = AsyncValue.error(e,StackTrace.empty);
    }
  }

  int length() => state.value?.length??0;

  HomeModel getItem(int index) => state.value?.elementAt(index)??HomeModel();
}