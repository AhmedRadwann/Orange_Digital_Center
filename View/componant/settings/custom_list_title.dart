import 'package:flutter/material.dart';

Widget List_item({
  required String listName,
  required Function() getScreen,
}) {
  return Column(
    children: [
      InkWell(
        child: ListTile(
          leading: Text("${listName}"),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        onTap: getScreen,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 12.5, 0),
        child: Container(
          width: double.infinity,
          height: 1.5,
          color: Colors.grey[300],
        ),
      ),
    ],
  );
}
