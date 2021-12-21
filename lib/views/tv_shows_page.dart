import 'package:clone_netflix/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

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
        color: Colors.red,
        height: double.maxFinite,
        width: double.maxFinite,

      ),
    );
  }
}
