import 'package:astrotak/screens/empty_screen.dart';
import 'package:astrotak/screens/talk_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astro Tak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainLayout(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<bool> navBtnAct = [true, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //app bar
          Container(
              height: 110,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
              //color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icons/hamburger.png",
                    width: 40,
                  ),
                  Image.asset(
                    "assets/icons/logo.png",
                    width: 80,
                  ),
                  Image.asset(
                    "assets/icons/profile.png",
                    width: 40,
                  )
                ],
              )),

          //content
          Flexible(child:navBtnAct[0]?const HomeScreen():navBtnAct[1]?const TalkScreen():const EmptyScreen()),

          //bottom nav
          Container(
            height: 70,
            padding: const EdgeInsets.only(top:10),
            color: const Color.fromRGBO(35, 35, 35, 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor:Colors.transparent,
                  highlightColor:Colors.transparent,
                  onTap: () {
                    setState(() {
                      navBtnAct=[true,false,false,false];
                    });
                  },
                  child: bottomNavButton("assets/icons/home.png", "Home",
                      active: navBtnAct[0]),
                ),
                InkWell(
                  splashColor:Colors.transparent,
                  highlightColor:Colors.transparent,
                  onTap: () {
                    setState(() {
                      navBtnAct=[false,true,false,false];
                    });
                  },
                  child: bottomNavButton(
                     navBtnAct[1]?"assets/icons/talk-clr.png":"assets/icons/talk.png", "Talk to Astrologer",active: navBtnAct[1]),
                ),
                InkWell(
                  splashColor:Colors.transparent,
                  highlightColor:Colors.transparent,
                  onTap: () {
                    setState(() {
                      navBtnAct=[false,false,true,false];
                    });
                  },
                  child:
                      bottomNavButton("assets/icons/ask.png", "Ask Question",active: navBtnAct[2]),
                ),
                InkWell(
                  splashColor:Colors.transparent,
                  highlightColor:Colors.transparent,
                  onTap: () {
                    setState(() {
                      navBtnAct=[false,false,false,true];
                    });
                  },
                  child: bottomNavButton("assets/icons/reports.png", "Reports",active: navBtnAct[3]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavButton(String imgPath, String title, {bool active = false}) {
    return Column(
      children: [
        Image.asset(imgPath, height: 25,color: active?const Color(0xFFF57F17):Colors.grey,),
        const SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: TextStyle(
              color: active ? const Color(0xFFF57F17) : Colors.grey, fontSize: 10),
        )
      ],
    );
  }
}
