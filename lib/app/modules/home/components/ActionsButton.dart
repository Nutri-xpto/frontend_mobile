import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mydiet/constants.dart';

class ActionsButton extends StatelessWidget {
  final String action;

  const ActionsButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          fixedSize: Size.fromWidth(150),
          //<-- VEJA AQUI,
          primary: primaryColorStrong,
          side: BorderSide(width: 1.0, color: primaryColorStrong),
        ),
        child: Text(
          action,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              fontSize: 15),
        ),
      ),
    );
  }
}
