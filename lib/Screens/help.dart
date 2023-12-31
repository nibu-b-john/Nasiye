import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/Help/language_button.dart';
import 'package:nasiye/Widgets/Help/prayer_button.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: color.secondary,
        foregroundColor: Colors.black,
        title: const Text(
          'Help',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02631),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const HelpLanguageButton(),
            const SizedBox(
              height: 0.02,
            ),
            HelpNormalRBTButton(
              imageUrl: 'assets/place1.jpg',
              titleText: "Normal RBT",
              serviceType: 'crbt',
            ),
            const SizedBox(
              height: 0.02,
            ),
            HelpNormalRBTButton(
              imageUrl: 'assets/place2.jpg',
              titleText: "Prayer RBT",
              serviceType: 'prayer',
            ),
            const SizedBox(
              height: 0.02,
            ),
            HelpNormalRBTButton(
              imageUrl: 'assets/man.jpg',
              titleText: "Name Tune",
              serviceType: 'nametone',
            ),
            HelpNormalRBTButton(
              imageUrl: 'assets/shuffle.png',
              titleText: "Shuffle",
              serviceType: 'shuffle',
            ),
          ],
        ),
      ),
    );
  }
}
