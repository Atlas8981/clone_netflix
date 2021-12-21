import 'package:clone_netflix/components/custom_app_bar.dart';
import 'package:clone_netflix/components/custom_scaffold.dart';
import 'package:clone_netflix/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            SpecialHomeContent(),
            MyListRow(),
          ],
        ),
      ),
      onlyAppBar: false,
    );
  }
}

class MyListRow extends StatelessWidget {
  const MyListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              100,
              (index) {
                return MyListItemRow();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyListItemRow extends StatelessWidget {
  const MyListItemRow({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  bottomText() {
    if (text != null) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 120,
          height: 150,
          padding: EdgeInsets.all(8),
          child: FittedBox(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              padding: EdgeInsets.all(5),
              child: Text(
                "New Episodes",
                style: TextStyle(fontSize: 11, height: 1),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.asset(
            "$imageDir/witcher_poster.jpg",
            width: 120,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        bottomText()
      ],
    );
  }
}

class SpecialHomeContent extends StatelessWidget {
  const SpecialHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "$imageDir/witcher_poster.jpg",
          fit: BoxFit.cover,
          height: 600,
          width: Get.width,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 600,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(1),
                      ],
                    ),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tab(
                          icon: Icon(Icons.add),
                          child: Text(
                            "My List",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Play",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          icon: Icon(Icons.info_outline),
                          child: Text(
                            "Something",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
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
