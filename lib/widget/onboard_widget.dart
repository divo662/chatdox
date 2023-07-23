import 'package:flutter/material.dart';

class OnboardContainer extends StatelessWidget {
  final Image image;
  const OnboardContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 84,
      child: image,
    );
  }
}
