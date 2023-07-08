import 'package:flutter/material.dart';

class MobileNumber extends StatelessWidget {
  const MobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color.onBackground,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.21114999999999998,
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
              'Login',
              style: TextStyle(
                  color: color.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02),
            ),
            SizedBox(
              height: size.height * 0.03125,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mobile Number',
                  style: TextStyle(),
                ),
                SizedBox(
                  height: size.height * 0.0075,
                ),
                SizedBox(
                  width: size.width * 0.8289,
                  height: size.height * 0.05,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        // contentPadding: EdgeInsets.symmetric(vertical: ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Mobile Number',
                        hintStyle: const TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.055,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otp');
              },
              style: ElevatedButton.styleFrom(backgroundColor: color.onPrimary),
              child: SizedBox(
                  width: size.width * 0.6605263157894737,
                  height: size.height * 0.0475,
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Submit',
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
