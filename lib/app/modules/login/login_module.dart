import 'package:mydiet/app/modules/diet_page/diet_page.dart';
import 'package:mydiet/app/modules/diet_page/diet_page_store.dart';
import 'package:mydiet/app/modules/home/home_module.dart';
import 'package:mydiet/app/modules/home/home_page.dart';
import 'package:mydiet/app/modules/home/home_store.dart';
import 'package:mydiet/app/modules/login/login_page.dart';
import 'package:mydiet/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/perfil/perfil_page.dart';
import 'package:mydiet/app/modules/perfil/perfil_store.dart';
import 'package:mydiet/app/modules/store/store_page.dart';
import 'package:mydiet/app/modules/store/store_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => DietPageStore()),
    Bind.lazySingleton((i) => PerfilStore()),
    Bind.lazySingleton((i) => StoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ChildRoute('/diet', child: (_, args) => const DietPage()),
    ChildRoute('/perfil', child: (_, args) => const PerfilPage()),
    ChildRoute('/store', child: (_, args) => const StorePage()),
  ];
}
