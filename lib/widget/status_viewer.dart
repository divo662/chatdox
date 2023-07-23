import 'package:flutter/material.dart';

class StatusViewer extends StatelessWidget {
  final String name;
  final IconData icon;
  const StatusViewer({Key? key, required this.name, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 69,
          height: 69,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue.shade500,
              width: 3.0,
            ),
            color: Colors.grey.shade200
          ),
          child: Icon(
            icon,
            size: 23,
            color: Colors.blue,
          ),
        ),
        Text(name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.5,
          color: Colors.black
        ),)
      ],
    );
  }
}
