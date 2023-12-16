import 'package:flutter/material.dart';

import '../Components/DressCard.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Expanded(
            flex: 3,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const DressCard();
                }),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const DressCard();
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Row(
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Container(
                    color: Colors.greenAccent,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Container(
                    color: Colors.greenAccent,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}