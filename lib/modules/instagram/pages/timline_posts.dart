import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itis/modules/instagram/stores/posts_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimelinePosts extends StatefulWidget {
  const TimelinePosts({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TimelinePostsState createState() => _TimelinePostsState();
}

class _TimelinePostsState extends State<TimelinePosts> {
  PostsStore _postsStore = Modular.get<PostsStore>();

  @override
  void initState(){
    super.initState();
    if (_postsStore.posts.length == 0){
      _postsStore.loadPosts().then((value) => null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: Center(
         child: Observer(builder: (context) {
          return GridView.builder(
              itemCount: _postsStore.posts[0].images!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    child: Image.network(_postsStore.posts[0].images!.cast()[index].link),
                    padding: EdgeInsets.all(8.0),
                )
                );
              });
         },)
       )
      )
    );
  }
}
