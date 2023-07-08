import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/carousel.dart';

class Nasheed extends StatefulWidget {
  const Nasheed({super.key});

  @override
  State<Nasheed> createState() => _NasheedState();
}

class _NasheedState extends State<Nasheed> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{"appbartitle": 'App Bar'}) as Map;
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.onBackground,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          arguments['appbartitle'],
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.375,
              child: const Carousel(),
            ),
            SizedBox(
              height: size.height * 0.0225,
            ),
            const Text(
              "Shine On You Crazy Diamond",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(
              height: size.height * 0.00125,
            ),
            const Text(
              "Normal RBT",
              style: TextStyle(color: Color(0xFF767676), fontSize: 12),
            ),
            SizedBox(
              height: size.height * 0.03125,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 30,
                  color: Color(0xFFC6C6C6),
                ),
                SizedBox(
                  width: size.width * 0.097222,
                ),
                const Icon(
                  Icons.wallet_giftcard_outlined,
                  size: 30,
                  color: Color(0xFFC6C6C6),
                ),
                SizedBox(
                  width: size.width * 0.097222,
                ),
                const Icon(
                  Icons.phonelink_ring_outlined,
                  size: 30,
                  color: Color(0xFFC6C6C6),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.05875,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0555),
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 2,
                        overlayShape: SliderComponentShape.noOverlay,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 5)),
                    child: Slider(
                      value: value.toDouble(),
                      min: 0,
                      max: 3.0,
                      activeColor: Colors.blue,
                      inactiveColor: color.secondary,
                      label: 'Set volume value',
                      onChanged: (double newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.00625,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '3:02',
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '4:29',
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.225,
                      vertical: size.height * 0.07125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: color.onPrimary,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: color.onPrimary,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Icon(
                      Icons.play_circle_fill_outlined,
                      color: color.onPrimary,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
