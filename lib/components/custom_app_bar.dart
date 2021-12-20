import 'package:flutter/material.dart';

class CustomAppBar {
  static customAppBar() {
    return [
      SliverAppBar(
        // expandedHeight: 200.0,
        floating: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterLogo(
              size: 42,
            ),
            Row(
              children: [
                Icon(
                  Icons.search,
                  size: 28,
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.verified_user,
                  size: 28,
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      SliverPersistentHeader(
        delegate: _SliverAppBarDelegate(
          TabBar(
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                text: "TV Shows",
              ),
              Tab(text: "Movies"),
              Tab(
                child: Row(
                  children: [
                    Text("Categories"),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ],
          ),
        ),
        pinned: true,
      ),
    ];
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
