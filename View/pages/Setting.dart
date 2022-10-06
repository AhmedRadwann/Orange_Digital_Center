import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/SharedPrefrence.dart';
import 'package:odc/View/componant/settings/custom_list_title.dart';
import 'package:odc/View/pages/FAQ.dart';
import 'package:odc/View/pages/Splash.dart';
import 'package:odc/View/pages/Support.dart';
import 'package:odc/View/pages/Terms&conditions.dart';
import 'package:odc/View/pages/home.dart';
import 'package:odc/View/pages/login.dart';
import 'package:odc/View/pages/ourPartner.dart';
import 'package:odc/View_model/Bloc/Settings/setting_cubit.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingCubit(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white38,
            shadowColor: Colors.white,
            elevation: 0,
            title: Text(
              "Setting",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: BlocConsumer<SettingCubit, SettingState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              SettingCubit myCubit = BlocProvider.of(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    List_item(
                        listName: 'FAQ',
                        getScreen: () {
                          myCubit.nav(FAQ(), context);
                        }),
                    List_item(
                        listName: 'Terms & Conditions',
                        getScreen: () {
                          myCubit.nav(terms(), context);
                        }),
                    List_item(
                        listName: 'Our Partenrs',
                        getScreen: () {
                          myCubit.nav(partner(), context);
                        }),
                    List_item(
                        listName: 'Support',
                        getScreen: () {
                          myCubit.nav(Support(), context);
                        }),
                    List_item(
                        listName: 'Log out',
                        getScreen: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("LogOut"),
                                    content: Text("Are you Sure"),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: [
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cansel"),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepOrange)),
                                        ),
                                        width: 120,
                                        height: 40,
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            CacheHelper.removerData(
                                                    key: "Token")
                                                .then((value) {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          splash()),
                                                  (route) => false);
                                            });
                                          },
                                          child: Text("Sure"),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepOrange)),
                                        ),
                                        width: 120,
                                        height: 40,
                                      )
                                    ],
                                  ));
                        }),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
