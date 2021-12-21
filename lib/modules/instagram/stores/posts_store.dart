import 'dart:math';
import 'package:flutter_itis/modules/instagram/models/image.dart';
import 'package:flutter_itis/modules/instagram/models/post.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {
  @observable
  ObservableList<Post> posts = ObservableList.of([]);
  var _postsBox;
  var _imagesBox;

  String _generateRandomString(int length) {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
  }


  @action
  Future loadPosts() async{
    this._postsBox = await Hive.openBox<Post>('posts');
    this._imagesBox = await Hive.openBox<PostImage>('images');
    if (this._postsBox.values.length == 0) {
      for (int i = 0; i < 11; i++) {
        List<PostImage> postImages = [];
        for (int i = 0; i < 6; i++) {
          PostImage image = PostImage(
              fromNet: true, link: 'https://picsum.photos/200');
          this._imagesBox.add(image);
          postImages.add(image);
        }
        Post post = Post(author: _generateRandomString(10),
            timestamp: DateTime
                .now()
                .millisecondsSinceEpoch,
            likesCount: Random().nextInt(10000),
            commentsCount: Random().nextInt(10000),
            description: lorem(paragraphs: 2, words: 30));
        this._postsBox.add(post);
        post.images = HiveList(this._imagesBox);
        post.images!.addAll(postImages);
      }
    }
    this.posts = ObservableList.of(_postsBox.values);
  }

  @action
  void addPost(Post post, List<PostImage> postImages){
    this._postsBox.add(post);
    post.images = HiveList(this._imagesBox);
    for(int i = 0; i < postImages.length; i++){
      this._imagesBox.add(postImages[i]);
    }
    post.images!.addAll(postImages);
    this.posts.add(post);
  }

  List<Post> getAuthorPosts(String author){
    return this._postsBox.values.where((post) => post.author == author);
  }

  ObservableList<Post> get reverse => ObservableList.of(this.posts.reversed);
}
