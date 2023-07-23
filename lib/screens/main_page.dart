import 'package:chatdox/screens/call.dart';
import 'package:chatdox/screens/camera.dart';
import 'package:chatdox/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 2;

  final List<Widget> page = [
    const CameraPage(),
    const CallPage(),
    const HomePage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[pageIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 9,
            onTabChange: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            selectedIndex: pageIndex,
            activeColor: Colors.blueAccent,
            iconSize: 29,
            tabBackgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(13),
            tabs: const [
              GButton(
                icon: Icons.camera_alt_rounded,
                text: "Camera",
              ),
              GButton(
                icon: Icons.call,
                text: "Call Logs",
              ),
              GButton(
                icon: Icons.wechat_sharp,
                text: "Chats",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
