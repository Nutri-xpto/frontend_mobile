import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/diet_page/components/card_diet_by_day.dart';
import 'package:mydiet/app/modules/diet_page/diet_page_store.dart';
import 'package:flutter/material.dart';
import 'package:mydiet/constants.dart';

class DietPage extends StatefulWidget {
  final String title;
  const DietPage({Key? key, this.title = 'DietPagePage'}) : super(key: key);
  @override
  DietPageState createState() => DietPageState();
}

class DietPageState extends State<DietPage> {
  final DietPageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorStrong,
          title: Text("Sua dieta completa",
              style: TextStyle(
                fontFamily: 'Montserrat',
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              CardDietByDay(
                day: "Segunda feira",
                meals: ['Café da manhã', 'Lanche', 'Almoço', 'Janta'],
              ),
              CardDietByDay(
                day: "Terça Feira",
                meals: ['Café da manhã', 'Lanche', 'Almoço', 'Janta'],
              ),
              CardDietByDay(
                day: "Quarta Feira",
                meals: ['Café da manhã', 'Lanche', 'Almoço', 'Janta'],
              ),
            ],
          ),
        ));
  }
}
