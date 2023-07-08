import 'package:flutter/material.dart';

class TrendingCardWidget extends StatelessWidget {
  String title;
  String subtitle;
  TrendingCardWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: ListTile(
        leading: SizedBox(
          height: size.height * 0.0625,
          width: size.width * 0.1315,
          child: const CircleAvatar(
              backgroundImage: AssetImage('assets/band.jpg')),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 10)),
        trailing: const Icon(Icons.menu),
      ),
    );
  }
}
