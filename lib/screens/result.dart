import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Components/DressCard.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        // Here you can write your code for open new view
        loaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> shirtimages = [
      'assets/blackshirt1.png',
      'assets/blackshirt2.png',
      'assets/blackshirt3.png',
      'assets/blackshirt-longsleeves1.png',
      'assets/blacksweatshirt.png',
      'assets/blackhoodie.png',
    ];

    List<Uri> shirtlinks = [
      Uri.parse('https://www.amazon.com/Plain-Black-Shirts-Athletic-Blank/dp/B07BR8HTJ8'),
      Uri.parse('https://www.amazon.com/Kirkland-Mens-Crew-Black-T-Shirts/dp/B07CN8KHXV'),
      Uri.parse('https://www.amazon.com/Plain-Black-Shirts-Athletic-Blank/dp/B07BR8HTJ8'),
      Uri.parse('https://www.amazon.com/Plain-Black-Shirts-Athletic-Blank/dp/B07BR8HTJ8'),
      Uri.parse('https://www.amazon.com/Plain-Black-Shirts-Athletic-Blank/dp/B07BR8HTJ8'),
      Uri.parse('https://www.amazon.com/Plain-Black-Shirts-Athletic-Blank/dp/B07BR8HTJ8'),
    ];

    return Scaffold(
      body: (!loaded)
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      child: Text(
                        ' Here are some shirts similar to what you presented',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: shirtimages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                              child: Column(
                            children: [
                              Expanded(flex:8,child: Image.asset(shirtimages[index])),
                              Spacer(),
                              Expanded(flex:2,child: TextButton(child: Text('Buy'), onPressed: () async{
                                if (!await launchUrl(shirtlinks[index])) {
                                throw Exception('Could not launch ${shirtlinks[index]}');
                                }
                              },))
                            ],
                          )),
                        );
                      }),
                ),
                Expanded(
                  child: Container(
                    child: Text('heh'),
                  ),
                  flex: 1,
                )
              ],
            ),
    );
  }
}
