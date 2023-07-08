import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasiye/Widgets/Help/help_card.dart';

class HelpNormalRBTButton extends StatefulWidget {
  String imageUrl;
  String titleText;
  String status;
  HelpNormalRBTButton(
      {super.key,
      required this.imageUrl,
      required this.titleText,
      required this.status});

  @override
  State<HelpNormalRBTButton> createState() => HelpNormalRBTButtonState();
}

class HelpNormalRBTButtonState extends State<HelpNormalRBTButton> {
  @override
  Widget build(BuildContext context) {
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
                        setState(() {
                          widget.status = widget.status == 'Subscribe'
                              ? 'Unsubscribe'
                              : 'Subscribe';
                        });
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
                  'Are you sure for ${widget.status}\n${widget.titleText}? ',
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
          status: widget.status),
    );
  }
}
