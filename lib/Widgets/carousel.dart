import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      items: [
        SizedBox(
          width: size.width * 0.75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: Image.asset('assets/place4.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: size.height * 0.375,
        enlargeCenterPage: true,
        autoPlay: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
