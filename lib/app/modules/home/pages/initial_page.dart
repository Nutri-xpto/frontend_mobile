import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mydiet/app/modules/home/components/ActionsButton.dart';
import 'package:mydiet/app/modules/home/components/MealCard.dart';
import 'package:mydiet/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool _isChecked = false;
  bool _isExpanded = false;

  List<String> _texts = [
    "Café da manhã",
    "Lanche",
    "Almoço",
    "Lanche",
    "Janta",
    "2l de água"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá Italo',
          style: TextStyle(
              fontFamily: 'Montserrat', fontWeight: FontWeight.normal),
        ),
        backgroundColor: primaryColorStrong,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Meta do dia",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "60%",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                LinearPercentIndicator(
                  barRadius: Radius.circular(10),
                  restartAnimation: true,
                  padding: EdgeInsets.only(top: 5),
                  lineHeight: 18,
                  percent: 0.5,
                  animation: true,
                  animationDuration: 1000,
                  backgroundColor: primaryColorWeek,
                  progressColor: primaryColorStrong,
                ), */
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 6.0, right: 6.0, bottom: 6.0),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        iconColor: primaryColorStrong,
                        trailing: !_isExpanded
                            ? Icon(
                                Icons.arrow_drop_down,
                                color: primaryColorStrong,
                              )
                            : Icon(
                                Icons.arrow_drop_up,
                                color: primaryColorWeek,
                              ),
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            _isExpanded = expanded;
                          });
                        },
                        collapsedIconColor: primaryColorStrong,
                        //collapsedTextColor: primaryColorStrong,
                        title: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Meta do dia",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "60%",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            barRadius: Radius.circular(10),
                            restartAnimation: true,
                            padding: EdgeInsets.only(top: 5),
                            lineHeight: 18,
                            percent: 0.5,
                            animation: true,
                            animationDuration: 1000,
                            backgroundColor: primaryColorWeek,
                            progressColor: primaryColorStrong,
                          ),
                        ]),
                        children: <Widget>[
                          Column(
                            children: _texts
                                .map((text) => CheckboxListTile(
                                      activeColor: primaryColorWeek,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      title: Text(
                                        text,
                                        style: TextStyle(
                                            fontFamily: 'Montessart',
                                            fontSize: 16),
                                      ),
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val!;
                                        });
                                      },
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                const Text(
                  "Segunda Feira",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: size.height * 0.45,
                  child: ListView(
                    children: [
                      MealCard(meal: 'Café da manhã'),
                      MealCard(meal: 'Lanche'),
                      MealCard(meal: 'Almoço'),
                      MealCard(meal: 'Janta'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: const [
                      Text(
                        "Próxima Consulta",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Terça Feira - 10:10 - 10/12",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ActionsButton(action: "Abrir calculadora de elementos"),
                      ActionsButton(action: "Mudar dia de consulta"),
                      ActionsButton(action: "Acessar dieta completa"),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
