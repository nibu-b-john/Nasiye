import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/Normal%20RBT/cards.dart';

class NormalRBT extends StatelessWidget {
  const NormalRBT({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: color.secondary,
        foregroundColor: Colors.black,
        title: const Text(
          'Normal RBT',
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02631),
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/nasheed',
                        arguments: {'appbartitle': 'Nasheed'});
                  },
                  child: const RBTCards(
                      image: 'assets/place1.jpg', text: 'Nasheed')),
              SizedBox(
                height: size.height * 0.02,
              ),
              const RBTCards(image: 'assets/place2.jpg', text: 'Gabay'),
              SizedBox(
                height: size.height * 0.02,
              ),
              const RBTCards(image: 'assets/place3.jpg', text: 'Duco'),
            ],
          )),
    );
  }
}
