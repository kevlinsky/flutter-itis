import 'package:hive/hive.dart';

part 'image.g.dart';

@HiveType(typeId: 1)
class PostImage extends HiveObject{
  @HiveField(0)
  final bool fromNet;
  @HiveField(1)
  final String link;

  PostImage({required this.fromNet, required this.link});
}