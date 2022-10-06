import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc/View/componant/Home/homeComponant.dart';
import 'package:odc/View/pages/Events.dart';
import 'package:odc/View/pages/Lecture.dart';
import 'package:odc/View/pages/Midterms.dart';
import 'package:odc/View/pages/finals.dart';
import 'package:odc/View/pages/notes.dart';
import 'package:odc/View/pages/sections.dart';
import 'package:odc/View_model/Bloc/homeNav/nav_cubit.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => NavCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "image/logo.png",
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: BlocConsumer<NavCubit, NavState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            NavCubit myCubit = BlocProvider.of(context);
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Custom_home_card(
                                      Title: 'lecture',
                                      Nav: () {
                                        myCubit.nav(Lecture(), context);
                                      },
                                    ),
                                    Custom_home_card(
                                      Title: 'sections',
                                      Nav: () {
                                        myCubit.nav(section(), context);
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Custom_home_card(
                                        Title: 'midterm',
                                        Nav: () {
                                          myCubit.nav(midterm(), context);
                                        },
                                      ),
                                      Custom_home_card(
                                        Title: 'final',
                                        Nav: () {
                                          myCubit.nav(finals(), context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Custom_home_card(
                                        Title: 'event',
                                        Nav: () {
                                          myCubit.nav(Events(), context);
                                        },
                                      ),
                                      Custom_home_card(
                                        Title: 'notes',
                                        Nav: () {
                                          myCubit.nav(notes(), context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
