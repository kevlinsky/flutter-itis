import 'package:flutter_itis/modules/api_chat/pages/second_task.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondTaskModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SecondTask(title: args.data))
  ];
}