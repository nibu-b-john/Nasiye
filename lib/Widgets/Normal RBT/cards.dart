import 'package:flutter/material.dart';

class RBTCards extends StatelessWidget {
  final String image;
  final String text;
  const RBTCards({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            // backgroundBlendMode: BlendMode.saturation,
          ),
          width: size.width * 0.8815,
          // width: double.infinity,
          height: size.height * 0.175,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
