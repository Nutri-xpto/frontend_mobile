import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mydiet/app/modules/diet_page/diet_page.dart';
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
  calculateGoalPercent() {}
  late String data;
  late String month;
  late String timeS;

  List<String> _texts = [
    "Café da manhã"
        "Lanche",
    "Almoço",
    "Lanche",
    "Janta",
    "2l de água"
  ];

  List<String> _mealCards = [
    'Café da manhã',
    'Lanche',
    'Almoço',
    'Janta',
  ];

  List<String> _paths = [
    'assets/cafe-da-manha.jpg',
    'assets/lanche.jpg',
    'assets/almoco.jpg',
    'assets/janta.jpg',
  ];

  Future<Object?> navigateToDietPage() {
    return Navigator.of(context).pushNamed('/home/diet');
  }

  @override
  void initState() {
    super.initState();
    data = DateTime.now().day.toString();
    month = DateTime.now().month.toString();
    timeS = '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}';
  }

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
                Container(
                  width: size.width,
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ActionsButton(
                        action: "Abrir calculadora de elementos",
                        onClick: () => {},
                      ),
                      ActionsButton(
                        action: "Mudar dia de consulta",
                        onClick: () => {
                          showDialog(
                              context: context,
                              builder: (((context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Sair",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: primaryColorWeek,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Socilitar",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: primaryColorStrong,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                      title: Text(
                                        "Selecione a data e hora",
                                        style:
                                            TextStyle(fontFamily: 'Montserrat'),
                                      ),
                                      content: Container(
                                        height: 180,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Selecione a data:",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () async {
                                                      final date =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2021),
                                                        lastDate:
                                                            DateTime(2024),
                                                      );
                                                      setState(() {
                                                        data = date!.day
                                                            .toString();
                                                        month = date!.month
                                                            .toString();
                                                      });
                                                    },
                                                    icon: Icon(
                                                        Icons.calendar_month)),
                                                Text(
                                                  "Dia: ${data}/${month}",
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Selecione a hora:",
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat'),
                                                ),
                                                IconButton(
                                                    onPressed: () async {
                                                      final time =
                                                          await showTimePicker(
                                                        initialTime:
                                                            TimeOfDay.now(),
                                                        context: context,
                                                      );
                                                      setState(() {
                                                        timeS =
                                                            '${time?.hour}:${time?.minute}';
                                                      });
                                                    },
                                                    icon:
                                                        Icon(Icons.lock_clock)),
                                                Text(
                                                  "Hora: ${timeS}",
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "OBS: Você receberá a confirmação da alteração apenas se o nutricionista aceitar",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat'),
                                            )
                                          ],
                                        ),
                                      )))))
                        },
                      ),
                      ActionsButton(
                        action: "Acessar dieta completa",
                        onClick: () =>
                            {Navigator.of(context).pushNamed('/home/diet')},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                  child: ListView.builder(
                    itemCount: _mealCards.length,
                    itemBuilder: ((context, index) {
                      return MealCard(
                          meal: _mealCards[index], imagePath: _paths[index]);
                    }),
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
              ],
            ),
          )),
    );
  }
}
