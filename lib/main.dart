import 'package:clone_netflix/utils/constant.dart';
import 'package:clone_netflix/utils/initial_binding.dart';
import 'package:clone_netflix/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const NetflixUiClone());
}

class NetflixUiClone extends StatelessWidget {
  const NetflixUiClone({Key? key}) : super(key: key);

  // final Map<int, Color> color =
  // {
  //   50:const Color.fromRGBO(229 , 9, 20, .1),
  //   100:const Color.fromRGBO(229 , 9, 20,.2),
  //   200:const Color.fromRGBO(229 , 9, 20, .3),
  //   300:const Color.fromRGBO(229 , 9, 20, .4),
  //   400:const Color.fromRGBO(229 , 9, 20, .5),
  //   500:const Color.fromRGBO(229 , 9, 20, .6),
  //   600:const Color.fromRGBO(229 , 9, 20, .7),
  //   700:const Color.fromRGBO(229 , 9, 20, .8),
  //   800:const Color.fromRGBO(229 , 9, 20, .9),
  //   900:const Color.fromRGBO(229 , 9, 20, 1.0),
  // };

  // final int primary = 0xE50914;
  //
  // final MaterialColor colorCustom = MaterialColor(primary, color);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Netflix UI Clone',
      initialBinding: InitialBinding(),
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        // backgroundColor: Colors.black,
        // scaffoldBackgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        primaryIconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.red,
              fontFamily: 'MartelSans',
            ),
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
