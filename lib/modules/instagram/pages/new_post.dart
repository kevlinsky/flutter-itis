import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_itis/modules/instagram/models/image.dart';
import 'package:flutter_itis/modules/instagram/models/post.dart';
import 'package:flutter_itis/modules/instagram/stores/posts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styled_widget/styled_widget.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  PostsStore _postsStore = Modular.get<PostsStore>();
  TextEditingController _authorEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();
  String _imagePath = '';

  void _getImageFromPhotoLibrary(context) {
    _getFile(ImageSource.gallery, context);
  }

  void _getFromCamera(context) {
    _getFile(ImageSource.camera, context);
  }

  Future<void> _getFile(ImageSource source, BuildContext context) async {
    try {
      final XFile? file = await ImagePicker().pickImage(source: source);
      setState(() {
        this._imagePath = file!.path;
      });
    } catch (e) {
      print(e);
    }
  }

  void _createPost(){
    if (_authorEditingController.text != '' && _descriptionEditingController.text != '' && _imagePath != ''){
      PostImage postImage = PostImage(fromNet: false, link: _imagePath);
      List<PostImage> images = [postImage];
      Post post = Post(author: _authorEditingController.text, timestamp: new DateTime.now().millisecondsSinceEpoch, likesCount: 0, commentsCount: 0, description: _descriptionEditingController.text);
      _postsStore.addPost(post, images);
      Modular.to.pop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        Modular.to.pop();
                      },
                    )
                  ],
                ),
              Text('Author').fontSize(15.0),
          TextField(
            controller: _authorEditingController,
            maxLength: 20,
          ),
          Text('Description').fontSize(15.0),
          TextField(
            controller: _descriptionEditingController,
            maxLength: 200,
          ),
          _imagePath != ''
                ? Container(
            alignment: Alignment.center,
              height: 200.0,
              child: Image.file(File(_imagePath)))
          : SizedBox(),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10.0),
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
                    padding: EdgeInsets.all(10.0),
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
          ]),
                Row(
                  children: [
                    Expanded(child:
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ElevatedButton(onPressed: _createPost, child: Text('Create post')))),
                  ],
                )
                // TextButton(onPressed: _createPost, child: Text('Create post'),)
          ],
    ),
        ),
      ),);
  }
}
