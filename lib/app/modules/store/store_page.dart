import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/login/components/TextFieldContainer.dart';
import 'package:mydiet/app/modules/store/store_store.dart';
import 'package:flutter/material.dart';
import 'package:mydiet/app/utils/data.dart';
import 'package:mydiet/constants.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  final StoreStore store = Modular.get();
  List<Map<String, dynamic>> _foundedItens = [];
  int optionSelected = 0;
  int pontos = 200;

  Widget optionRadio(String text, int index) {
    return TextButton(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              color: (optionSelected == index)
                  ? Colors.white
                  : primaryColorStrong),
        ),
        onPressed: () {
          setState(() {
            optionSelected = index;
            if (index == 0) {
              _foundedItens = allUsers;
            } else {
              _foundedItens = purchasedItens;
            }
          });
        },
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            splashFactory: NoSplash.splashFactory,
            backgroundColor: (optionSelected == index)
                ? primaryColorStrong
                : Colors.transparent));
  }

  @override
  initState() {
    if (optionSelected == 0) {
      _foundedItens = allUsers;
    } else {
      _foundedItens = purchasedItens;
    }
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      if (optionSelected == 0) {
        results = allUsers;
      } else {
        results = purchasedItens;
      }
    } else {
      if (optionSelected == 0) {
        results = allUsers
            .where((user) => user["product"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      } else {
        results = purchasedItens
            .where((user) => user["product"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundedItens = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorStrong,
          actions: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${pontos} pontos",
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
              ),
            ))
          ],
          title: Text(
            "Loja",
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: primaryColorWeek.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _runFilter(value),
                    cursorColor: primaryColorStrong,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: primaryColorStrong,
                        ),
                        hintText: "Pesquise um item",
                        hintStyle: TextStyle(
                            color: primaryColorStrong,
                            fontFamily: 'Montserrat'),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    optionRadio("Itens da loja", 0),
                    optionRadio("Seus itens", 1)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: _foundedItens.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 150,
                                  mainAxisSpacing: 10),
                          itemCount: _foundedItens.length,
                          itemBuilder: (context, index) => Card(
                            shadowColor: primaryColorStrong,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            key: ValueKey(_foundedItens[index]["product"]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  child: ListTile(
                                    title: Text(_foundedItens[index]['product'],
                                        style: TextStyle(
                                            color: primaryColorStrong,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        '${_foundedItens[index]["points"].toString()} points',
                                        style: TextStyle(
                                            color: primaryColorStrong,
                                            fontFamily: 'Montserrat')),
                                  ),
                                ),
                                Container(
                                    child: (optionSelected == 0)
                                        ? TextButton(
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: ((context) =>
                                                    AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      title: Text(
                                                        _foundedItens[index]
                                                            ['product'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                primaryColorStrong),
                                                      ),
                                                      actions: [
                                                        Text(
                                                          _foundedItens[index]
                                                              ['description'],
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  primaryColorWeek),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Text(
                                                          "Seus pontos: ${pontos}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  primaryColorStrong),
                                                        ),
                                                        Text(
                                                          "Quantos pontos custa: ${_foundedItens[index]['points']}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  primaryColorStrong),
                                                        ),
                                                        Text(
                                                          "Saldo final: ${pontos - _foundedItens[index]['points']}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  primaryColorStrong),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                              child: Text(
                                                                "Sair",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        primaryColorWeek),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  pontos = (pontos -
                                                                      _foundedItens[
                                                                              index]
                                                                          [
                                                                          'points']) as int;
                                                                });
                                                                purchasedItens.add(
                                                                    _foundedItens[
                                                                        index]);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Comprar",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        primaryColorStrong),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ))),
                                            style: TextButton.styleFrom(
                                              primary: primaryColorStrong,
                                              side: BorderSide(
                                                  width: 1,
                                                  color: primaryColorStrong),
                                            ),
                                            child: Text(
                                              "Comprar",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          )
                                        : Text(
                                            "Item adquirido",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat'),
                                          ))
                              ],
                            ),
                          ),
                        )
                      : const Text(
                          'Nenhum item encontrado',
                          style:
                              TextStyle(fontSize: 23, fontFamily: 'Montserrat'),
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
