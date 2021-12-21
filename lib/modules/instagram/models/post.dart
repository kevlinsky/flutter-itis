import 'package:flutter_itis/modules/instagram/models/image.dart';
import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 2)
class Post extends HiveObject{
  @HiveField(0)
  final String author;
  @HiveField(1)
  HiveList? images;
  @HiveField(2)
  final int timestamp;
  @HiveField(3)
  final int likesCount;
  @HiveField(4)
  final int commentsCount;
  @HiveField(5)
  final String description;

  Post(
      {required this.author,
      required this.timestamp,
      required this.likesCount,
      required this.commentsCount,
      required this.description});
}


