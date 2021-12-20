import 'package:clone_netflix/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'utils/constant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarIconBrightness: Brightness.light,
    ),
  );
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
        // backgroundColor: Colors.black,
        // scaffoldBackgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        primaryIconTheme: IconThemeData(color: Colors.white),
      ),
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
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            ...CustomAppBar.customAppBar(),
            SliverToBoxAdapter(
              child: Tab1(),
            )
          ],
        )
      ),
    );
  }
}

class Solution1 extends StatelessWidget {
  const Solution1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return CustomAppBar.customAppBar();
      },
      body: TabBarView(
        children: [
          Tab1(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "$imageDir/witcher_poster.jpg",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "$imageDir/witcher_poster.jpg",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "$imageDir/witcher_poster.jpg",
            fit: BoxFit.cover,
          ),
        ],
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
