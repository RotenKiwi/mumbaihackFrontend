import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesynth/screens/camera_click.dart';
import 'package:stylesynth/screens/result.dart';

import '../Components/DressCard.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  File? galleryFile;
  final picker = ImagePicker();
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
                          'Upload an Image',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          _showPicker(context: context);
                        },
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                // ClipRRect(
                //   borderRadius: const BorderRadius.all(Radius.circular(40)),
                //   child: Container(
                //     color: Colors.greenAccent,
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 15.0),
                //       child: TextButton(
                //         child: Text(
                //           'Camera',
                //           style: TextStyle(
                //             fontSize: 40,
                //             color: Colors.black,
                //           ),
                //         ),
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) =>
                //                       TakePictureScreen(camera: widget.camera)));
                //         },
                //       ),
                //     ),
                //   ),
                // ),
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

void _showPicker({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () {
                getImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                getImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Future getImage(
    ImageSource img,
    ) async {
  final pickedFile = await picker.pickImage(source: img);
  XFile? xfilePick = pickedFile;
  setState(
        () {
      if (xfilePick != null) {
        galleryFile = File(pickedFile!.path);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Results()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
            const SnackBar(content: Text('Nothing is selected')));
      }
    },
  );
}
}