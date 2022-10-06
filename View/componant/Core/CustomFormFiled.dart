import 'package:flutter/material.dart';
import 'package:odc/View_model/Bloc/Login/login_cubit.dart';

Widget CustomFormFiled({
  required String title,
  IconData? passwordIcon,
  required var controller,
  bool obsecure = false,
  bool isPassword = false,
  bool isEmail = true,
  Function()? changeObsecure,
  Color? FormColor,
}) =>
    TextFormField(
        controller: controller,
        autocorrect: false,
        cursorColor: Colors.deepOrange,
        keyboardType: TextInputType.text,
        obscureText: obsecure,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.deepOrange),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.deepOrange,
            ),
          ),
          labelText: '$title',
          suffixIcon: IconButton(
            onPressed: changeObsecure,
            icon: Icon(isPassword
                ? obsecure
                    ? passwordIcon = Icons.visibility
                    : passwordIcon = Icons.visibility_off_outlined
                : null),
            color: Colors.deepOrange,
          ),
          labelStyle: TextStyle(
            color: FormColor,
          ),
        ));
