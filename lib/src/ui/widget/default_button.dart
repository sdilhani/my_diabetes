import 'dart:ui';

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onClick;

  DefaultButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return new OutlinedButton(
        style: outlineButtonStyle,
        child: new Text(text, textScaleFactor: 1.1),
        onPressed: onClick,
    );
  }

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color.fromARGB(255, 95, 183, 1),
    minimumSize: Size(280, 47),
    textStyle: TextStyle(color: Colors.white),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return BorderSide(
            color: Colors.grey,
            width: 2,
          );
        else
          return BorderSide(
            color: Colors.black,
            width: 1,
          );
      },
    ),
  );
}
