
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {

  final String hint;
  final Function onChange;
  final bool isSecure;
  final TextInputType type;

  DefaultTextField(this.hint, this.onChange, this.isSecure, this.type);

  TextField build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 95, 183, 1), width: 2.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        hintText: hint
      ),
      onChanged: onChange,
      obscureText: isSecure,
      keyboardType: type,
    );
  }
}
