import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget Custom_card(
    {required String title,
    int time = 2,
    required String day,
    required String start,
    required String end}) {
  return Card(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 10,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.grey[800],
                  ),
                  Text(
                    '${time} hrs',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lecture Day',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey[500]),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "Icons/event.svg",
                        width: 25,
                        color: Colors.black,
                      ),
                      Text(
                        '${day}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Time',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey[500]),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "Icons/time.svg",
                        width: 20,
                        color: Colors.green,
                      ),
                      Text(
                        ' ${start}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End Time',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey[500]),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "Icons/time.svg",
                        width: 20,
                        color: Colors.red,
                      ),
                      Text(
                        ' ${end}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
