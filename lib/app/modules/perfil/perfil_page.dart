import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/perfil/perfil_store.dart';
import 'package:flutter/material.dart';
import 'package:mydiet/constants.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = 'PerfilPage'}) : super(key: key);
  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends State<PerfilPage> {
  final PerfilStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColorStrong,
        title: Text(
          "Perfil",
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
