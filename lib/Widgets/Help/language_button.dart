import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/Help/help_card.dart';

class HelpLanguageButton extends StatefulWidget {
  const HelpLanguageButton({super.key});

  @override
  State<HelpLanguageButton> createState() => HelpLanguageButtonState();
}

class HelpLanguageButtonState extends State<HelpLanguageButton> {
  String radioValue = 'Somali';
  @override
  Widget build(BuildContext context) {
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
                              value: 'Somali',
                              groupValue: radioValue,
                              onChanged: (val) {
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
                                  radioValue = val!;
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
                              value: 'English',
                              groupValue: radioValue,
                              onChanged: (val) {
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
                                  radioValue = val!;
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
          titleText: "Language - $radioValue",
          status: 'Change'),
    );
  }
}
