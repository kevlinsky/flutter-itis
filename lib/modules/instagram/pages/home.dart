import 'package:flutter/material.dart';
import 'package:flutter_itis/modules/instagram/models/image.dart';
import 'package:flutter_itis/modules/instagram/pages/utils/post.dart';
import 'package:flutter_itis/modules/instagram/pages/utils/story.dart';
import 'package:flutter_itis/modules/instagram/stores/posts_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:styled_widget/styled_widget.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<String> stories_accounts = [
    'kevlinsky',
    'syyunek',
    'kingstertime',
    'g_eazy',
    'affected_boyz',
    'kanyewest'
  ];
  PostsStore _postsStore = Modular.get<PostsStore>();

  @override
  void initState() {
    super.initState();
    _postsStore.loadPosts().then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Instagram').textColor(Colors.black),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              Modular.to.pushNamed('/instagram/new-post');
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.black,
                            ))),
                  ],
                )
              ],
            )),
        body: Column(
          children: [
            // stories
            Container(
                height: 90,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: stories_accounts.length,
                    itemBuilder: (context, index) {
                      return Story(accountName: stories_accounts[index]);
                    })),
            //posts

            Observer(builder: (context) {
              return Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: _postsStore.reverse.length,
                    itemBuilder: (context, index) {
                      String author = _postsStore.reverse[index].author;
                      List<PostImage> images =
                          _postsStore.reverse[index].images!.cast();
                      int timestamp = _postsStore.reverse[index].timestamp;
                      int likesCount = _postsStore.reverse[index].likesCount;
                      int commentsCount = _postsStore.reverse[index].commentsCount;
                      String description = _postsStore.reverse[index].description;
                      return Post(
                        likesCount,
                          author: author,
                          images: images,
                          timestamp: timestamp,
                          commentsCount: commentsCount,
                          description: description);
                    }),
              );}
            ),
          ],
        ));
  }
}
