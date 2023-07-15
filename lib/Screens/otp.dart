import 'dart:convert';
import 'dart:developer';
import '../shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool fill_num = false;
  final _form = GlobalKey<FormState>();
  Widget _textField({first, last, size}) {
    return SizedBox(
      height: size.height * 0.0625,
      width: size.width * 0.1315,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.isEmpty && first == true) {
            FocusScope.of(context).unfocus();
          }
          if (value.length == 1 && last == true) {
            FocusScope.of(context).unfocus();
          }

          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && last == false && first == false) {
            FocusScope.of(context).previousFocus();
          }
          if (value.isEmpty && last == true) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  void onsubmit(String username) async {
    final url = Uri.parse('http://149.28.148.198:8082/security/authenticate');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"username": username, "password": "2023"}));
    final decodedResponse = jsonDecode(response.body);
    if (decodedResponse['token'].length != 0) {
      await Shared_Preferences.setToken(decodedResponse['token'].toString());
      Navigator.pushNamed(context, '/subscribe');
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

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
                  'OTP Verification',
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
                      'Enter OTP',
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: size.height * 0.0075,
                    ),
                    SizedBox(
                      width: size.width * 0.8289,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textField(first: true, last: false, size: size),
                          _textField(first: false, last: false, size: size),
                          _textField(first: false, last: false, size: size),
                          _textField(first: false, last: false, size: size),
                          _textField(first: false, last: true, size: size),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                SizedBox(
                  width: size.width * 0.8236,
                  child: Text(
                    '01:59',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: color.onPrimary),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01625,
                ),
                ElevatedButton(
                  onPressed: () {
                    onsubmit(arguments['mobNumber']);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color.onPrimary),
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
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: TextStyle(color: color.onPrimary),
                    ))
              ],
            ),
          ),
        ));
  }
}
