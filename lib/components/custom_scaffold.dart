import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'custom_app_bar.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    Key? key,
    this.child,
    this.onlyAppBar = true,
  }) : super(key: key);

  final Widget? child;
  final bool onlyAppBar;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  late ScrollController _scrollController;

  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          offset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color changingColor =
        Colors.black.withOpacity((offset / 350).clamp(0, 0.8).toDouble());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverStack(
            children: [
              SliverToBoxAdapter(
                child: widget.child
              ),
              (widget.onlyAppBar)
                  ? SliverAppBar(
                      floating: true,
                      snap: true,
                      backgroundColor: changingColor,
                      titleSpacing: 0,
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
                    )
                  : CustomAppBar(
                      scrollOffset: offset,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
