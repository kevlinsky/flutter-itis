import 'package:flutter_itis/modules/api_chat/stores/message_store.dart';
import 'package:flutter_itis/modules/gallery/stores/gallery_images_store.dart';
import 'package:flutter_itis/modules/gallery/third_task_module.dart';
import 'package:flutter_itis/modules/instagram/instagram_module.dart';
import 'package:flutter_itis/modules/instagram/stores/posts_store.dart';
import 'package:flutter_itis/modules/single_chat/first_task_module.dart';
import 'package:flutter_itis/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../api_chat/second_task_module.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MessageStore()),
    Bind.singleton((i) => GalleryImageStore()),
    Bind.singleton((i) => PostsStore()),
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => MyHomePage(title: 'Homeworks list')),
    ModuleRoute('/first-task', module: FirstTaskModule()),
    ModuleRoute('/second-task', module: SecondTaskModule()),
    ModuleRoute('/third-task', module: ThirdTaskModule()),
    ModuleRoute('/instagram', module: InstagramModule())
  ];
}