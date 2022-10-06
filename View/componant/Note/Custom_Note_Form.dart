import 'package:flutter/material.dart';

Widget Custom_Note_Filed({
  String? hint,
  String? label,
  int? MaxLine,
  bool? isDate,
  TextEditingController? controller,
}) =>
    TextFormField(
      controller: controller,
      enabled: isDate,
      maxLines: MaxLine,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: hint,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
