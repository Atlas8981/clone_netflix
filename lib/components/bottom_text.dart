import 'package:clone_netflix/utils/constant.dart';
import 'package:flutter/material.dart';

class BottomTexts extends StatelessWidget {
  const BottomTexts({
    Key? key,
    this.bottomTextModels,
  }) : super(key: key);

  final List<BottomTextModel>? bottomTextModels;

  @override
  Widget build(BuildContext context) {
    if (bottomTextModels == null) {
      return Container();
    }
    return Positioned.fill(
      bottom: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(bottomTextModels!.length, (index) {
          return BottomText(
            bottomTextModel: bottomTextModels![index],
          );
        }),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    Key? key,
    required this.bottomTextModel,
  }) : super(key: key);

  final BottomTextModel bottomTextModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: bottomTextModel.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Text(
        bottomTextModel.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          height: 1.5,
          fontWeight: FontWeight.bold,
          color: bottomTextModel.textColor,
        ),
      ),
    );
  }
}

class BottomTextModel {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  BottomTextModel({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });
}
