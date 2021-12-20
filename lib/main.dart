import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, statusBarIconBrightness: Brightness.light));
  runApp(const NetflixUiClone());
}

class NetflixUiClone extends StatelessWidget {
  const NetflixUiClone({Key? key}) : super(key: key);

  // final Map<int, Color> color =
  // {
  //   50:const Color.fromRGBO(229 , 9, 20, .1),
  //   100:const Color.fromRGBO(229 , 9, 20,.2),
  //   200:const Color.fromRGBO(229 , 9, 20, .3),
  //   300:const Color.fromRGBO(229 , 9, 20, .4),
  //   400:const Color.fromRGBO(229 , 9, 20, .5),
  //   500:const Color.fromRGBO(229 , 9, 20, .6),
  //   600:const Color.fromRGBO(229 , 9, 20, .7),
  //   700:const Color.fromRGBO(229 , 9, 20, .8),
  //   800:const Color.fromRGBO(229 , 9, 20, .9),
  //   900:const Color.fromRGBO(229 , 9, 20, 1.0),
  // };

  // final int primary = 0xE50914;
  //
  // final MaterialColor colorCustom = MaterialColor(primary, color);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Netflix UI Clone',
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
          primaryColor: const Color.fromRGBO(100, 229, 9, 1),
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.white)),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final statusBarHeight = MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  // expandedHeight: 200.0,
                  floating: false,
                  title: Text("Netflix"),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      // labelColor: Colors.black87,
                      // unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info), text: "Tab 1"),
                        Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                        Tab(
                            icon: Icon(Icons.assistant_direction),
                            text: "Tab 3"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                Icon(Icons.flight, size: 350),
                Icon(Icons.directions_transit, size: 350),
                Icon(Icons.directions_car, size: 350),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
