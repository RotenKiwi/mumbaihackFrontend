import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:stylesynth/screens/camera_click.dart';

import '../Components/DressCard.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextButton(
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Container(
                    color: Colors.greenAccent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextButton(
                        child: Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TakePictureScreen(camera: camera)));
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
