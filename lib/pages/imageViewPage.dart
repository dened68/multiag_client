// ignore_for_file: file_names
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({Key? key, required String this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        imageProvider: NetworkImage(url),
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       "Чертеж",
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     backgroundColor: Colors.black,
    //   ),
    //   body: Expanded(
    //     child: Container(
    //       color: Colors.black,
    //       child: PhotoView(
    //         imageProvider: NetworkImage(url),
    //       ),
    //     ),
    //   ),
    // );
  }
}
