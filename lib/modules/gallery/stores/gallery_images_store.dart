import 'package:mobx/mobx.dart';
import '../models/gallery_image.dart';

part 'gallery_images_store.g.dart';

class GalleryImageStore = _GalleryImageStore with _$GalleryImageStore;

abstract class _GalleryImageStore with Store{
  @observable
  ObservableList<GalleryImage> galleryImages = ObservableList.of([]);

  @action
  void addImage(GalleryImage galleryImage){
    this.galleryImages.add(galleryImage);
  }

  @computed
  ObservableList<GalleryImage> get reverse => ObservableList.of(this.galleryImages.reversed);
}