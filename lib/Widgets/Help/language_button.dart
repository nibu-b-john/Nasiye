import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/Help/help_card.dart';
import 'package:nasiye/shared_preference.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class HelpLanguageButton extends StatefulWidget {
  const HelpLanguageButton({super.key});

  @override
  State<HelpLanguageButton> createState() => HelpLanguageButtonState();
}

class HelpLanguageButtonState extends State<HelpLanguageButton> {
  String language = '';
  Future<String> getLanguage() async {
    String lang = await Shared_Preferences.getLanguage();
    setState(() {
      language = lang;
    });
    return language;
  }

  void updateLanguage() async {
    String token = await Shared_Preferences.getToken();

    final url = Uri.parse('http://149.28.148.198:8082/api/langupdate');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({"langid": language}));
    // final decodedResponse = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getLanguage();
    ColorScheme color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) => AlertDialog(
                  titlePadding: const EdgeInsets.only(top: 25),
                  actions: [
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black26,
                      child: Row(
                        children: [
                          Radio(
                              activeColor: color.onPrimary,
                              value: 'sp',
                              groupValue: language,
                              onChanged: (val) {
                                updateLanguage();
                                Shared_Preferences.setLanguage(val!);
                                getLanguage();
                                Navigator.pop(context);

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        title: Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.green,
                                          size: 80,
                                        ),
                                        content: Padding(
                                            padding: EdgeInsets.all(9),
                                            child: Text(
                                              'You have changed language successfully',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                      );
                                    });
                                setState(() {
                                  language = val;
                                });
                              }),
                          const Text(
                            'Somali',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black26,
                      child: Row(
                        children: [
                          Radio(
                              activeColor: color.onPrimary,
                              value: 'en',
                              groupValue: language,
                              onChanged: (val) {
                                updateLanguage();
                                Shared_Preferences.setLanguage(val!);
                                getLanguage();

                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        title: Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.green,
                                          size: 80,
                                        ),
                                        content: Padding(
                                            padding: EdgeInsets.all(9),
                                            child: Text(
                                              'You have changed language successfully',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                      );
                                    });
                                setState(() {
                                  language = val;
                                });
                              }),
                          const Text(
                            'English',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                  title: const Text(
                    'Change Your Language',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            });
      },
      child: HelpCardWidget(
          imageUrl: 'assets/band.jpg',
          titleText: "Language - $language",
          status: 'Change'),
    );
  }
}
