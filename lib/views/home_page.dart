import 'package:clone_netflix/components/bottom_text.dart';
import 'package:clone_netflix/components/custom_bottom_sheets.dart';
import 'package:clone_netflix/components/custom_scaffold.dart';
import 'package:clone_netflix/utils/constant.dart';
import 'package:flutter/cupertino.dart';
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
            ContinueWatchingList(),
            MyListRow(),
            OnlyOnNetflixRow(),
            TrendingRow(),
          ],
        ),
      ),
      onlyAppBar: false,
    );
  }
}

class ContinueWatchingList extends StatelessWidget {
  const ContinueWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageRowStarterWidget(
      title: "Continue Watching for Atlas",
      itemRow: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) {
              return ContinueWatchingRowItem(
                inMyList: false,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ContinueWatchingRowItem extends StatelessWidget {
  const ContinueWatchingRowItem({
    Key? key,
    this.inMyList,
  }) : super(key: key);

  final bool? inMyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            HomePageItem(
              inMyList: inMyList,
            ),
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: darkGrey.withOpacity(0.8),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    size: 48,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  // color: Colors.red,
                  height: 150 / 4,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    // color: darkGrey.withOpacity(0.8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 120,
          child: LinearProgressIndicator(
            minHeight: 2,
            value: 0.2,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(
              primaryColor,
            ),
          ),
        ),
        Container(
          color: darkGrey,
          // height: 150/4,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(),
                onPressed: () {
                  showCustomBottomSheet(
                    child: ContentInfoBottomSheet(),
                  );
                },
                icon: Icon(Icons.info_outline),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(),
                onPressed: () {
                  showCustomBottomSheet(
                    child: MoreInfoBottomSheet(),
                  );
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingRow extends StatelessWidget {
  const TrendingRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageRowStarterWidget(
      title: "Trending",
      itemRow: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) {
              return HomePageItem();
            },
          ),
        ),
      ),
    );
  }
}

class OnlyOnNetflixRow extends StatelessWidget {
  const OnlyOnNetflixRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageRowStarterWidget(
      title: "Only On Netflix",
      itemRow: SingleChildScrollView(
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
    );
  }
}

class OnlyOnNetflixItem extends StatelessWidget {
  const OnlyOnNetflixItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomBottomSheet(child: ContentInfoBottomSheet());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Ink.image(
                image: AssetImage("$imageDir/witcher_poster.jpg"),
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
      ),
    );
  }
}

class MyListRow extends StatelessWidget {
  const MyListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageRowStarterWidget(
      itemRow: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) {
              return HomePageItem();
            },
          ),
        ),
      ),
    );
  }
}

class HomePageRowStarterWidget extends StatelessWidget {
  const HomePageRowStarterWidget({
    Key? key,
    this.title = "My List",
    required this.itemRow,
  }) : super(key: key);

  final String? title;
  final Widget itemRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "$title",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                wordSpacing: 0),
          ),
        ),
        itemRow,
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: List.generate(
        //       10,
        //           (index) {
        //         return HomePageItem();
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class HomePageItem extends StatelessWidget {
  const HomePageItem({
    Key? key,
    this.inMyList = false,
  }) : super(key: key);

  final bool? inMyList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          showCustomBottomSheet(child: ContentInfoBottomSheet());
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Ink.image(
                image: AssetImage(
                  "$imageDir/witcher_poster.jpg",
                ),
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            BottomTexts(),
            Visibility(
              visible: inMyList!,
              child: Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                      )),
                  child: Icon(
                    Icons.check,
                    size: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//The biggest image with play, add to list, and information
class SpecialHomeContent extends StatelessWidget {
  const SpecialHomeContent({Key? key}) : super(key: key);

  void onPressedInfoButton(BuildContext context) {
    showCustomBottomSheet(child: ContentInfoBottomSheet());
  }

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
                          iconMargin: EdgeInsets.symmetric(vertical: 3),
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
                                size: 28,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Play",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  // height: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            onPressedInfoButton(context);
                          },
                          child: Tab(
                            icon: Icon(Icons.info_outline),
                            child: Text(
                              "Something",
                              style: TextStyle(color: Colors.white),
                            ),
                            iconMargin: EdgeInsets.symmetric(vertical: 3),
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
