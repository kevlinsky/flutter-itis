import 'package:flutter/material.dart';
import 'package:flutter_itis/modules/gallery/models/gallery_image.dart';
import 'package:styled_widget/styled_widget.dart';

class ImagePage extends StatefulWidget{
  const ImagePage({Key? key, required this.singleImage}) : super(key: key);

  final GalleryImage singleImage;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text(widget.singleImage.title)
            .textColor(Colors.white)
            .fontSize(15)
            .fontWeight(FontWeight.bold),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: InteractiveViewer(child: Image.file(widget.singleImage.imageFile),),
                    )
                  ),
                ],
              )),
        ))
    );
  }
}