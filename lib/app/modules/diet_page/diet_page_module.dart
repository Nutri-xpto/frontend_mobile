import 'package:mydiet/app/modules/diet_page/diet_page.dart';
import 'package:mydiet/app/modules/diet_page/diet_page_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DietPageModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DietPageStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DietPage()),
  ];
}
