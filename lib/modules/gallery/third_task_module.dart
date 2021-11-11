import 'package:flutter_itis/modules/gallery/pages/image_page.dart';
import 'package:flutter_itis/modules/gallery/pages/third_task.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ThirdTaskModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ThirdTask(title: args.data)),
        ChildRoute('/:id',
            child: (context, args) => ImagePage(singleImage: args.data),
            transition: TransitionType.scale)
      ];
}
