import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/diet_page/diet_page_module.dart';
import 'package:mydiet/app/modules/login/login_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/diet', module: DietPageModule()),
  ];
}
