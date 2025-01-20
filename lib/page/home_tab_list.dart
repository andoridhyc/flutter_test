import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hy/model/home_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../viewmodel/home_tab_list_view_model.dart';
import '../widget/image_text_item.dart';

class HomeTabList extends ConsumerStatefulWidget  {
  const HomeTabList({super.key});



  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabListState();
}

class _HomeTabListState extends ConsumerState<HomeTabList> {

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  HomeTabListViewModel viewModel = HomeTabListViewModel();

  @override
  void initState() {
    super.initState();
    //读取assets文件夹中的 home_list.json文件
    // 在页面加载时触发下拉刷新
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 自动触发下拉刷新，避免手动触发 onRefresh
      onRefresh();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var items = ref.watch(viewModel.fetchDataProvider.select((value) => value));
      return SmartRefresher(
        enablePullDown:true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: items.when(
            data: (data){
             return ListView.builder(
                  itemCount: data.length,
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) {
                    var item = data[index];
                    return ImageTextItem(item: item,onLikeTap: (){
                      item.likeNum =  (item.likeNum??0) + 1;
                      ref.read(viewModel.fetchDataProvider.notifier).refreshItem(index,item);
                    },);
                  });
            },
            error: (e,s){
              print(e);
              return Text("加载失败:${e}");
            },
            loading: (){
              return Center(child: CircularProgressIndicator());
            }
        ),
      );
    });
  }

  onRefresh() async{
    //进行网络请求，
    _refreshController.requestRefresh();
    ref.read(viewModel.fetchDataProvider.notifier).loadItems();
    _refreshController.refreshCompleted();
  }

  onLoading() async{
    //进行网络请求，
    await Future.delayed(Duration(milliseconds: 1000));
    ref.read(viewModel.fetchDataProvider.notifier).onLoading();
    _refreshController.loadComplete();
  }


}
