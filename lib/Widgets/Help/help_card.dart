import 'package:flutter/material.dart';

class HelpCardWidget extends StatefulWidget {
  final String imageUrl;
  final String titleText;
  final String status;
  const HelpCardWidget(
      {super.key,
      required this.imageUrl,
      required this.titleText,
      required this.status});

  @override
  State<HelpCardWidget> createState() => _HelpCardWidgetState();
}

class _HelpCardWidgetState extends State<HelpCardWidget> {
  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Card(
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: SizedBox(
        width: 335,
        height: 64,
        child: Center(
          child: ListTile(
            leading: SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.1222,
              child: CircleAvatar(backgroundImage: AssetImage(widget.imageUrl)),
            ),
            title: Text(
              widget.titleText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              widget.status,
              style: TextStyle(
                  color: color.onPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
