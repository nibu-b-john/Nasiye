import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/Help/help_card.dart';
import 'package:http/http.dart' as http;
import '../../shared_preference.dart';

class HelpNormalRBTButton extends StatefulWidget {
  String imageUrl;
  String titleText;
  String serviceType;
  HelpNormalRBTButton(
      {super.key,
      required this.imageUrl,
      required this.titleText,
      required this.serviceType});

  @override
  State<HelpNormalRBTButton> createState() => HelpNormalRBTButtonState();
}

class HelpNormalRBTButtonState extends State<HelpNormalRBTButton> {
  String status = '';
  void subscribe() async {
    log('Enter subscribe');
    String token = await Shared_Preferences.getToken();
    // log(token);
    final url = Uri.parse('http://149.28.148.198:8082/api/subscribe');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({"langid": "en", "offer": widget.serviceType}));
    final decodedResponse = jsonDecode(response.body);
    log(decodedResponse.toString());
    if (decodedResponse['result'] == 'FAIL') {
      setState(() {
        status = 'Unsubscribe';
      });
    } else {
      setState(() {
        status = 'Subscribe';
      });
    }
  }

  void unsubscribe() async {
    log('Enter unsubscribe');
    String token = await Shared_Preferences.getToken();

    final url = Uri.parse('http://149.28.148.198:8082/api/unsubscribe');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({"langid": "en", "offer": widget.serviceType}));
    final decodedResponse = jsonDecode(response.body);
    log(decodedResponse.toString());

    if (decodedResponse['result'] == 'FAIL') {
      setState(() {
        status = 'Subscribe';
      });
    } else {
      setState(() {
        status = 'Unsubscribe';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscribe();
  }

  @override
  Widget build(BuildContext context) {
    // subscribe();
    ColorScheme color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.only(top: 25),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                actions: [
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const SizedBox(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: color.onPrimary),
                      onPressed: () {
                        if (status == 'Subscribe') {
                          unsubscribe();
                        } else if (status == 'Unsubscribe') {
                          subscribe();
                        }
                        Navigator.pop(context);
                      },
                      child: const SizedBox(
                        child: Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
                title: Text(
                  'Are you sure, you want to ${status == 'Subscribe' ? 'Unsubscribe' : 'Subscribe'}\n${widget.titleText}? ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            });
      },
      child: HelpCardWidget(
          imageUrl: widget.imageUrl,
          titleText: widget.titleText,
          status: status),
    );
  }
}
