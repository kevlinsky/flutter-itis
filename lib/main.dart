import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_module.dart';
import 'modules/instagram/models/image.dart';
import 'modules/instagram/models/post.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostImageAdapter());
  Hive.registerAdapter(PostAdapter());
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homework project',
    ).modular();
  }
}