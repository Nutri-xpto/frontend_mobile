import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/perfil/components/info.dart';
import 'package:mydiet/app/modules/perfil/perfil_store.dart';
import 'package:flutter/material.dart';
import 'package:mydiet/constants.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isMealAlarmActivated = false;
  bool isWaterAlarmActivated = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContainer('Peso Atual', '136kg'),
              SizedBox(width: 40),
              buildContainer('Meta de peso', '120kg'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContainer('Pontos', '150'),
              SizedBox(width: 40),
              buildContainer('Seus Itens', '10'),
            ],
          ),
          SizedBox(height: 40),
          Text(
            "Configurações",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ativar notificação das refeições",
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                Switch(
                  value: isMealAlarmActivated,
                  onChanged: (value) {
                    setState(() {
                      isMealAlarmActivated = value;
                    });
                  },
                  activeTrackColor: primaryColorWeek,
                  activeColor: primaryColorStrong,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ativar notificação para lembrar de tomar água",
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                Switch(
                  value: isWaterAlarmActivated,
                  onChanged: (value) {
                    setState(() {
                      isWaterAlarmActivated = value;
                    });
                  },
                  activeTrackColor: primaryColorWeek,
                  activeColor: primaryColorStrong,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildContainer(String text, String information) {
  return Container(
    height: 100,
    width: 130,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryColorWeek.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.4,
            0.3,
          ],
          colors: [primaryColorStrong, primaryColorWeek],
        ),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            information,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
