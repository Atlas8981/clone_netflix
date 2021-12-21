import 'package:clone_netflix/components/bottom_text.dart';
import 'package:clone_netflix/components/custom_scaffold.dart';
import 'package:clone_netflix/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SpecialHomeContent(),
            MyListRow(),
            OnlyOnNetflixList(),
          ],
        ),
      ),
      onlyAppBar: false,
    );
  }
}

class OnlyOnNetflixList extends StatelessWidget {
  const OnlyOnNetflixList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, top: 8),
          child: Text(
            "Only On Netflix",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) {
                return OnlyOnNetflixItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class OnlyOnNetflixItem extends StatelessWidget {
  const OnlyOnNetflixItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              "$imageDir/witcher_poster.jpg",
              width: 175,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          BottomTexts(
            bottomTextModels: [
              BottomTextModel(
                text: "New Episode",
                backgroundColor: primaryColor,
                textColor: Colors.white,
              ),
              BottomTextModel(
                text: "Weekly",
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
            ],
          )
        ],
      ),
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
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "My List",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Stack(
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
          BottomTexts(),
        ],
      ),
    );
  }
}

//The biggest image with play, add to list, and information
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
                      ),
                    ),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    height: 2),
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
