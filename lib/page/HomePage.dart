import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var tabs = ["推荐", "热门", "tab", "ta2","推荐", "热门", "tab", "ta2"];
  TabController? _tabController;
  PageController? _pageController;
  var future = FutureProvider((ref){
    return Future.delayed(Duration(seconds: 2),(){
      return "123";
    });
  });


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child){
      final asyncValue = ref.watch(future);
      return SafeArea(
          child: Container(
              child:asyncValue.when(
                  data: (value){
                    return Column(
                      children: [
                        TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          controller: _tabController,
                          tabs: tabs.map((it) {
                            return Tab(text: it);
                          }).toList(),
                        ),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            children: tabs.map((it) {
                              return Text(it);
                            }).toList(),
                          ),
                        )
                      ],
                    );
                  },
                  error:(error, stackTrace){
                    return Text("错误");
                  },
                  loading: (){
                    return Text("加载中");
                  }
              ),
              ));
    });
  }
}
