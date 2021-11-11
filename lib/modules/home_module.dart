import 'package:flutter_itis/pages/first_task.dart';
import 'package:flutter_itis/pages/home_page.dart';
import 'package:flutter_itis/pages/second_task.dart';
import 'package:flutter_itis/stores/message_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MessageStore())
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => MyHomePage(title: 'Homeworks list')),
    ChildRoute('/first-task', child: (context, args) => FirstTask(title: args.data,)),
    ChildRoute('/second-task', child: (context, args) => SecondTask(title: args.data))
  ];
}