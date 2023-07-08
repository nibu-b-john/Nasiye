import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/carousel.dart';

class MyRBT extends StatefulWidget {
  const MyRBT({super.key});

  @override
  State<MyRBT> createState() => _MyRBTState();
}

class _MyRBTState extends State<MyRBT> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'My RBT',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: size.height * 0.375,
                  child: SizedBox(
                    width: size.width * 0.75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child:
                            Image.asset('assets/place4.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.29166,
                  bottom: -size.height * 0.0325,
                  child: Icon(
                    Icons.play_circle_fill_outlined,
                    color: color.onPrimary,
                    size: 60,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.0575,
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
              height: size.height * 0.05625,
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
            SizedBox(
              height: size.height * 0.04375,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              height: size.height * 0.05625,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: color.onPrimary),
              child: SizedBox(
                  width: size.width * 0.6605263157894737,
                  height: size.height * 0.0475,
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Copy Tone',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
