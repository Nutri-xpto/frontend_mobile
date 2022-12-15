import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mydiet/app/models/meal_description.dart';
import 'package:mydiet/app/utils/data.dart';
import 'package:mydiet/app/utils/utils.dart';
import 'package:mydiet/constants.dart';

class MealPage extends StatefulWidget {
  final String meal;
  final String imagePath;
  const MealPage({super.key, required this.meal, required this.imagePath});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int optionSelected = 0;

  Widget optionRadio(String option, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
            child: Text(
              option,
              style: TextStyle(
                  color: (optionSelected == index)
                      ? Colors.white
                      : primaryColorStrong),
            ),
            onPressed: () {
              setState(() {
                optionSelected = index;
              });
            },
            style: TextButton.styleFrom(
                elevation: 20,
                splashFactory: NoSplash.splashFactory,
                backgroundColor: (optionSelected == index)
                    ? primaryColorStrong
                    : Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
              child: SafeArea(
                  child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        widget.meal,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Horário: 8h30',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          optionRadio('1 OPÇÃO', 0),
                          optionRadio('2 OPÇÃO', 1),
                          optionRadio('3 OPÇÃO', 2)
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    opacity: 0.5,
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(50.0),
                  bottomRight: const Radius.circular(50.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: primaryColorStrong,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: primaryColorWeek,
              ),
            ),
            Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: ListView(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Receita",
                      style: TextStyle(
                          color: primaryColorStrong,
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    // ignore: prefer_const_literals_to_create_immutables
                    DataTable(columns: [
                      const DataColumn(label: Text('Ingredientes')),
                      const DataColumn(label: Text('Quantidade')),
                    ], rows: getRows(allMealDescription)),
                    const SizedBox(height: 25),
                    const Text(
                      "Modo de preparo",
                      style: TextStyle(
                          color: primaryColorStrong,
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      style: TextStyle(
                          color: primaryColorStrong,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataRow> getRows(List<MealDescription> descriptions) =>
      descriptions.map((MealDescription mealDescription) {
        final rows = [mealDescription.ingredients, mealDescription.quantity];

        return DataRow(
          cells: Utils.modelBuilder(rows, (index, cell) {
            return DataCell(
              Text('$cell'),
            );
          }),
        );
      }).toList();
}
