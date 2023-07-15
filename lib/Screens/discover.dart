import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Widgets/Discover/trending_card.dart';
import '../shared_preference.dart';

class DiscoverScreen extends StatefulWidget {
  bool subscribed;
  DiscoverScreen({super.key, this.subscribed = false});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.subscribed == true) {
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
                    "Thanks,\nYou have been successfully subscribed for RBT service",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            });
      }
      widget.subscribed = false;
    });
  }

  Future<String> message(String servicetype) async {
    final url = Uri.parse('http://149.28.148.198:8082/api/aoc');
    final getToken = Shared_Preferences.getToken();

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${await getToken.then((value) => value)}'
        },
        body: jsonEncode({"langid": "en", "servicetype": servicetype}));
    final decodedResponse = jsonDecode(response.body);

    return decodedResponse['message'];
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> categories = [
      {
        "image": "assets/ringtone.jpg",
        "text": "Normal RBT",
        "route": "/normalRBT",
        "alert": false,
        'servicetype': ''
      },
      {
        "image": "assets/tajMahal.jpg",
        "text": "Prayer RBT",
        "route": "/nasheed",
        "alert": true,
        'servicetype': 'prayer'
      },
      {
        "image": "assets/man.jpg",
        "text": "Name Tune",
        "route": "/nasheed",
        "alert": true,
        'servicetype': 'nametone'
      },
      {
        "image": "assets/shuffle.png",
        "text": "Shuffle",
        "route": "/nasheed",
        "alert": true,
        'servicetype': 'shuffle'
      },
    ];
    return Scaffold(
      backgroundColor: color.onBackground,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05263),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.085,
              ),
              SizedBox(
                // width: size.width * 0.8289,
                height: size.height * 0.05,
                child: TextFormField(
                  cursorColor: color.onPrimary,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.black38,
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
                      hintText: 'Search a song / artist',
                      hintStyle: const TextStyle(fontSize: 12)),
                ),
              ),
              SizedBox(
                height: size.height * 0.02875,
              ),
              const Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: size.height * 0.4275,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (categories[index]['alert']) {
                          message(categories[index]['servicetype'])
                              .then((value) => {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actionsAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            actions: [
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              color.onPrimary),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        categories[index]
                                                            ['route']!,
                                                        arguments: {
                                                          'appbartitle':
                                                              categories[index]
                                                                  ['text']!
                                                        });
                                                    // Navigator.pop(context);
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
                                            content: Text(
                                              '$value\n\nDo you accept?',
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        })
                                  });
                        } else {
                          Navigator.pushNamed(
                              context, categories[index]['route']!);
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.15,
                            width: size.width * 0.3157,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              // maxRadius: 15,
                              // minRadius: 15,
                              backgroundImage:
                                  AssetImage(categories[index]['image']!),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.0125,
                          ),
                          Text(
                            categories[index]['text']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Top Trending',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TrendingCardWidget(
                title: 'Shine On You Crazy Diamond',
                subtitle: 'Pink Floyd (123456)',
              ),
              TrendingCardWidget(
                title: 'Shine On You Crazy Diamond',
                subtitle: 'Pink Floyd (123456)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
