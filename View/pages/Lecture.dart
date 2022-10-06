import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc/View/componant/Core/Card.dart';
import 'package:odc/View_model/Bloc/Lucture/lecture_cubit.dart';

class Lecture extends StatelessWidget {
  const Lecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LectureCubit()..getData(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 5,
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Lecture',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 10),
                  child: PopupMenuButton(
                    color: Colors.white,
                    child: SvgPicture.asset(
                      "Icons/filter.svg",
                      height: 25,
                      color: Colors.deepOrange,
                    ),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: Text("All Lecture"),
                        value: "All Lecture",
                      ),
                      PopupMenuItem(
                        child: Text("Finshed Lecture"),
                        value: "Finshed Lecture",
                      ),
                      PopupMenuItem(
                        child: Text("Remaining Lecture"),
                        value: "Remaining Lecture",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: BlocConsumer<LectureCubit, LectureState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                LectureCubit myCubit = BlocProvider.of(context);
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: myCubit.modelData == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: myCubit.modelData!.data!.length,
                          itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 110,
                            child: Custom_card(
                              title: myCubit
                                  .modelData!.data![index]!.lectureSubject
                                  .toString(),
                              day: myCubit.modelData!.data![index]!.lectureDate
                                  .toString(),
                              start: myCubit
                                  .modelData!.data![index]!.lectureStartTime
                                  .toString(),
                              end: myCubit
                                  .modelData!.data![index]!.lectureEndTime
                                  .toString(),
                            ),
                          ),
                        ),
                );
              },
            )),
      );
}
