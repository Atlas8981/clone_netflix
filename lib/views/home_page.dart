import 'package:clone_netflix/components/custom_app_bar.dart';
import 'package:clone_netflix/components/custom_scaffold.dart';
import 'package:clone_netflix/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final statusBarHeight = MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Tab1(),
      onlyAppBar: false,
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
