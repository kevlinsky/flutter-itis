// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_images_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GalleryImageStore on _GalleryImageStore, Store {
  Computed<ObservableList<GalleryImage>>? _$reverseComputed;

  @override
  ObservableList<GalleryImage> get reverse => (_$reverseComputed ??=
          Computed<ObservableList<GalleryImage>>(() => super.reverse,
              name: '_GalleryImageStore.reverse'))
      .value;

  final _$galleryImagesAtom = Atom(name: '_GalleryImageStore.galleryImages');

  @override
  ObservableList<GalleryImage> get galleryImages {
    _$galleryImagesAtom.reportRead();
    return super.galleryImages;
  }

  @override
  set galleryImages(ObservableList<GalleryImage> value) {
    _$galleryImagesAtom.reportWrite(value, super.galleryImages, () {
      super.galleryImages = value;
    });
  }

  final _$_GalleryImageStoreActionController =
      ActionController(name: '_GalleryImageStore');

  @override
  void addImage(GalleryImage galleryImage) {
    final _$actionInfo = _$_GalleryImageStoreActionController.startAction(
        name: '_GalleryImageStore.addImage');
    try {
      return super.addImage(galleryImage);
    } finally {
      _$_GalleryImageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
galleryImages: ${galleryImages},
reverse: ${reverse}
    ''';
  }
}
