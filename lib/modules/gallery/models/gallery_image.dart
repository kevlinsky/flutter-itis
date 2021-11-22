import 'dart:io';

class GalleryImage {
  final String id;
  final String title;
  final File imageFile;

  GalleryImage({required this.id, required this.title, required this.imageFile});
}