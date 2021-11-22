import 'package:flutter_itis/modules/single_chat/pages/first_task.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirstTaskModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => FirstTask(title: args.data))
  ];
}