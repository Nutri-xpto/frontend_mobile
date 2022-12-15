import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/diet_page/diet_page.dart';
import 'package:mydiet/app/modules/diet_page/diet_page_store.dart';
import 'package:mydiet/app/modules/perfil/perfil_page.dart';
import 'package:mydiet/app/modules/perfil/perfil_store.dart';
import 'package:mydiet/app/modules/store/store_page.dart';
import 'package:mydiet/app/modules/store/store_store.dart';
import 'home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => DietPageStore()),
    Bind.lazySingleton((i) => PerfilStore()),
    Bind.lazySingleton((i) => StoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/diet', child: (_, args) => DietPage()),
    ChildRoute('/perfil', child: (_, args) => const PerfilPage()),
    ChildRoute('/store', child: (_, args) => const StorePage()),
  ];
}
