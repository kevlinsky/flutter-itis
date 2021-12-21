import 'package:flutter_itis/modules/instagram/homepage.dart';
import 'package:flutter_itis/modules/instagram/pages/new_post.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InstagramModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
    ChildRoute('/new-post', child: (context, args) => NewPost())
  ];
}