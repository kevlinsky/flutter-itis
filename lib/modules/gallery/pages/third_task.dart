import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itis/modules/gallery/models/gallery_image.dart';
import 'package:flutter_itis/modules/gallery/stores/gallery_images_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:uuid/uuid.dart';

class ThirdTask extends StatefulWidget {
  const ThirdTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ThirdTaskState createState() => _ThirdTaskState();
}

class _ThirdTaskState extends State<ThirdTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          title: Text(widget.title)
              .textColor(Colors.white)
              .fontSize(25)
              .fontWeight(FontWeight.bold),
        ),
        body: SafeArea(
            child: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ImageListView(),
                    flex: 6,
                  ),
                  Expanded(child: ImagePickerView())
                ],
              )),
        )));
  }
}

class ImageListView extends StatefulWidget {
  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  GalleryImageStore _galleryImageStore = Modular.get<GalleryImageStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GridView.builder(
        // reverse: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: _galleryImageStore.galleryImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              child: Image.file(_galleryImageStore.galleryImages[index].imageFile,
                  fit: BoxFit.cover),
              padding: EdgeInsets.all(8.0),
            ),
            onTap: () {
              Modular.to.pushNamed(
                  '/third-task/${_galleryImageStore.galleryImages[index].id}',
                  arguments: _galleryImageStore.galleryImages[index]);
            },
          );
        },
      );
    });
  }
}

class ImagePickerView extends StatefulWidget {
  @override
  _ImagePickerViewState createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  GalleryImageStore _galleryImageStore = Modular.get<GalleryImageStore>();
  Uuid uuid = Uuid();

  void _getImageFromPhotoLibrary(context) {
    _getFile(ImageSource.gallery, context);
  }

  void _getFromCamera(context) {
    _getFile(ImageSource.camera, context);
  }

  Future<void> _getFile(ImageSource source, BuildContext context) async {
    try {
      print(source);
      final XFile? file = await ImagePicker().pickImage(source: source);
      setState(() {
        _galleryImageStore.addImage(new GalleryImage(
            id: uuid.v1(),
            title: DateTime.now().toString(),
            imageFile: File(file!.path)));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
      Expanded(
          child: Container(
              padding: EdgeInsets.only(right: 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton.icon(
                    icon: Icon(Icons.photo_camera),
                    label: Text("Camera"),
                    onPressed: () {
                      _getFromCamera(context);
                    },
                  ),
                ],
              ))),
      Expanded(
          child: Container(
              padding: EdgeInsets.only(right: 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton.icon(
                    icon: Icon(Icons.photo),
                    label: Text("Catalog"),
                    onPressed: () {
                      _getImageFromPhotoLibrary(context);
                    },
                  ),
                ],
              )))
    ]);
  }
}
