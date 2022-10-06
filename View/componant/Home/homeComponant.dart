import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget Custom_home_card({
  required String Title,
  required Function() Nav,
}) {
  return InkWell(
    child: Container(
      width: 160,
      height: 120,
      child: Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        shadowColor: Colors.black,
        elevation: 10,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 30,
                ),
                SvgPicture.asset(
                  "Icons/${Title}.svg",
                  width: 40,
                  color: Colors.deepOrange,
                ),
              ],
            ),
            Text(
              "${Title}",
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    ),
    onTap: Nav,
  );
}
