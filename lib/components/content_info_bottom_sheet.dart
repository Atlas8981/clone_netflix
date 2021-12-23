import 'package:clone_netflix/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_text.dart';

class ContentInfoBottomSheet extends StatelessWidget {
  const ContentInfoBottomSheet({Key? key}) : super(key: key);

  static const List<String> contentMetadata = [
    "2021",
    "18+",
    "2 Seasons",
  ];

  Widget buttonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Play",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Tab(
            iconMargin: EdgeInsets.zero,
            icon: Icon(Icons.file_download_outlined),
            text: "Download",
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Tab(
            iconMargin: EdgeInsets.zero,
            icon: Icon(Icons.play_arrow_outlined),
            text: "Trailer",
          ),
        ),
      ],
    );
  }

  contentImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Image.asset(
            "$imageDir/witcher_poster.jpg",
            width: 120,
            height: 150,
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
          ],
        ),
        Positioned(
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
        )
      ],
    );
  }

  contentText() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          Text(
            "The Witcher",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 22, height: 1),
          ),
          //Metadata
          Row(
            children: List.generate(
              contentMetadata.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    contentMetadata[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          // Description,
          Text(
            dummyDescription,
            // maxLines: 4,
            style: TextStyle(
                // fontSize: 12,
                height: 1.5,
                letterSpacing: 0.1,
                wordSpacing: 0.1),
          ),
        ],
      ),
    );
  }

  Widget contentInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentImage(),
        SizedBox(
          width: 8,
        ),
        contentText(),
      ],
    );
  }

  Widget specialText() {
    return Container(
      width: 100,
      // color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: primaryColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.thumb_up,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Most Liked",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              // height: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButton({String? text}) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      title: Text(
        text ?? "Episodes & Info",
        style: TextStyle(height: 3),
      ),
      horizontalTitleGap: 0,
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: darkGrey,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 12,
                  right: 8,
                  left: 8,
                ),
                child: Column(
                  children: [
                    contentInfo(),
                    specialText(),
                    buttonsRow(),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 1,
              ),
              bottomButton(),
            ],
          ),
          Positioned(
            top: 8,
            right: 12,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.cancel_outlined,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showCustomBottomSheet() {
  if (Get.isBottomSheetOpen!) {
    return;
  }
  Get.bottomSheet(
    ContentInfoBottomSheet(),
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    enterBottomSheetDuration: Duration(milliseconds: 150),
    exitBottomSheetDuration: Duration(milliseconds: 150),
  );
}
