import 'package:flutter/material.dart';
import 'package:nasiye/Screens/discover.dart';
import 'package:nasiye/Screens/nasheed.dart';
import 'package:nasiye/Screens/normal_rbt.dart';
import 'package:nasiye/Screens/otp.dart';
import 'package:nasiye/Screens/subscribe.dart';
import 'Screens/language.dart';
import 'Screens/mobile_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              onPrimary: Color(0xFF45AC4D),
              onBackground: Color(0xFFF4FAEE),
              secondary: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const LanguageScreen(),
      routes: {
        '/mobilenumber': (context) => const MobileNumber(),
        '/otp': (context) => const OtpScreen(),
        '/subscribe': (context) => const SubscibeScreen(),
        '/discover': (context) => DiscoverScreen(),
        '/normalRBT': (context) => const NormalRBT(),
        '/nasheed': (context) => const Nasheed(),
      },
    );
  }
}


// function h (pix){console.log(pix / 800);}

// function w (pix){console.log(pix / 360);}