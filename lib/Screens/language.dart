import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int radioValue = 0;
  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.onBackground,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.20875,
              ),
              Text(
                'Nasiye',
                style: TextStyle(
                    color: color.onPrimary,
                    fontWeight: FontWeight.w300,
                    fontSize: size.height * 0.0625),
              ),
              SizedBox(
                height: size.height * 0.12285,
              ),
              Text(
                'Language',
                style: TextStyle(
                    color: color.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02),
              ),
              SizedBox(
                height: size.height * 0.03125,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: size.width * 0.87,
                // width: size.width * 0.87,
                height: size.height * 0.05,
                child: Row(
                  children: [
                    Radio(
                        activeColor: color.onPrimary,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: (val) {
                          setState(() {
                            radioValue = val!;
                          });
                        }),
                    const Text(
                      'SOMALI',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.0175,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: size.width * 0.87,
                height: size.height * 0.05,
                child: Row(
                  children: [
                    Radio(
                        activeColor: color.onPrimary,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (val) {
                          setState(() {
                            radioValue = val!;
                          });
                        }),
                    const Text(
                      'ENGLISH',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04375,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mobilenumber');
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: color.onPrimary),
                child: SizedBox(
                    width: size.width * 0.6605263157894737,
                    height: size.height * 0.0475,
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
