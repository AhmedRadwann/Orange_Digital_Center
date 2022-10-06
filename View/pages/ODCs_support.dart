import 'package:flutter/material.dart';

class ods extends StatelessWidget {
  String? title;
  String? image;
  String? cool;
  String? Body;
  ods(
    String title,
    String image,
    String cool,
    String Body,
  ) {
    this.title = title;
    this.image = image;
    this.cool = cool;
    this.Body = Body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Center(
                              child: Image.network(
                            "${image}",
                            height: 120,
                            fit: BoxFit.cover,
                          )),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[200],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white38,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "${title}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "${cool}",
                          style: TextStyle(
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                            child: Text(
                          "$Body",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
