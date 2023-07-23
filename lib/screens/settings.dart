import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Chatdox Settings",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            Icon(Icons.more_horiz_sharp,
              color: Colors.black,
              size: 24,)
          ],
        ),

      ),
      body: const Center(
        child: Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: Colors.blue
          ),
        ),
      ),
    );
  }
}
