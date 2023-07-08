import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/bottom_navbar.dart';

class SubscibeScreen extends StatelessWidget {
  const SubscibeScreen({super.key});

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
                height: size.height * 0.21114,
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
                'Subscribe',
                style: TextStyle(
                    color: color.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02),
              ),
              SizedBox(
                height: size.height * 0.03125,
              ),
              // Image.asset('assets/tap.png')
              Icon(
                Icons.touch_app_outlined,
                size: size.height * 0.17875,
              ),
              SizedBox(
                height: size.height * 0.0245,
              ),
              const Text('You will charge 0.75 cent for 30 Days.'),
              SizedBox(
                height: size.height * 0.04875,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                            size: size.height * 0.125,
                          ),
                          content: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              "Dear Subscriber, You do not have sufficient balance to use this service. Please top up your account first & then subscriber again",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      });
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: color.onPrimary),
                child: SizedBox(
                    width: size.width * 0.6605263157894737,
                    height: size.height * 0.0475,
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Subscribe X',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/discover');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NavBar()));
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: color.onPrimary),
                child: SizedBox(
                    width: size.width * 0.6605263157894737,
                    height: size.height * 0.0475,
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Subscribe',
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
