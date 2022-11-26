import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mydiet/constants.dart';

class CardDietByDay extends StatefulWidget {
  final String day;
  final List<String> meals;
  const CardDietByDay({super.key, required this.day, required this.meals});

  @override
  State<CardDietByDay> createState() => _CardDietByDayState();
}

class _CardDietByDayState extends State<CardDietByDay> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: primaryColorWeek,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 6.0),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(vertical: 20),
                iconColor: primaryColorStrong,
                trailing: !_isExpanded
                    ? Icon(
                        Icons.arrow_drop_down,
                        color: primaryColorStrong,
                      )
                    : Icon(
                        Icons.arrow_drop_up,
                        color: primaryColorStrong,
                      ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                collapsedIconColor: primaryColorStrong,
                //collapsedTextColor: primaryColorStrong,
                title: Text(
                  widget.day,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Column(
                    children: widget.meals
                        .map((text) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: primaryColorStrong),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              margin: EdgeInsets.symmetric(vertical: 7),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
