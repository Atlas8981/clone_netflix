import 'package:clone_netflix/components/custom_scaffold.dart';
import 'package:clone_netflix/utils/constant.dart';
import 'package:clone_netflix/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsPage extends StatefulWidget {
  const TvShowsPage({
    Key? key,
  }) : super(key: key);

  @override
  _TvShowsPageState createState() => _TvShowsPageState();
}

class _TvShowsPageState extends State<TvShowsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Container(
      // color: Colors.red,
      height: 100,
      child: Center(
        child: Text(
          "TV Shows",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
