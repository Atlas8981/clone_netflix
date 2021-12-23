import 'package:clone_netflix/utils/constant.dart';
import 'package:clone_netflix/views/tv_shows_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);
  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    final Color changingColor =
        Colors.black.withOpacity((scrollOffset / 350).clamp(0, 0.8).toDouble());
    return MultiSliver(
      children: [
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: changingColor,
          titleSpacing: 8,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterLogo(
                size: 42,
              ),
              // Image.asset(
              //   "$imageDir/netflix.png",
              //   width: 50,
              //   fit: BoxFit.cover
              //   ,
              //   // height: 50,
              // ),
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
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SafeAreaPersistentHeaderDelegate(
            backgroundColor: changingColor,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _AppBarButton(
                        title: 'TV Shows',
                        onTap: () => Get.to(() => TvShowsPage()),
                      ),
                      _AppBarButton(
                        title: 'Movies',
                        onTap: () => print('Movies'),
                      ),
                      _AppBarButton(
                        title: 'My List',
                        onTap: () => print('My List'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SafeAreaPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final Color backgroundColor;

  SafeAreaPersistentHeaderDelegate({
    required this.child,
    required this.backgroundColor,
  });

  final double height = 70.0;

  late final double _maxExtent = height;
  late final double _minExtent = height;

  bool determineSafeArea(double shrinkOffset, bool overlapsContent) {
    if (overlapsContent) {
      return false;
    }

    if (shrinkOffset - height == 30) {
      return false;
    }

    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        top: !overlapsContent,
        child: SizedBox(
          height: height,
          child: child,
        ),
      ),
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SafeAreaPersistentHeaderDelegate old) {
    return false;
  }
}
