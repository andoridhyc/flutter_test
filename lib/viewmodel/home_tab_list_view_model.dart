
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_model.dart';
import '../notifier/home_list_notifier.dart';

class HomeTabListViewModel {
  int page = 0;
  Future<List<HomeModel>> loadJson() async{
    var jsonData = await _loadJson("assets/home_list.json");
    var list = jsonData.map<HomeModel>((e){
     return HomeModel.fromJson(e);
    }).toList();
    return Future((){
      return list;
    });
  }

  Future<List<HomeModel>> onLoading() async{
    final String jsonStr = await rootBundle.loadString("assets/home_list.json");
    List<HomeModel> list = [];
    json.decode(jsonStr).forEach((element) {
      HomeModel plan = HomeModel.fromJson(element);
      list.add(plan);
    });
    return list;
  }
  Future<List<Map<String,dynamic>>> _loadJson(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    final List<Map<String,dynamic>> jsonList = json.decode(jsonString);
    return jsonList;
  }

  final fetchDataProvider = StateNotifierProvider<HomeListNotifier,AsyncValue<List<HomeModel>>>((ref){
    return HomeListNotifier(const AsyncValue.data([]));
  });
}

