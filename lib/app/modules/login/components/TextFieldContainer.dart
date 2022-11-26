import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mydiet/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: primaryColorWeek.withOpacity(0.6),
          borderRadius: BorderRadius.circular(25)),
      child: child,
    );
  }
}
