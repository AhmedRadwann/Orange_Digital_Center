import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:odc/View_model/Bloc/HomeLayout/home_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeCubit myCubit = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: myCubit.widgetOptions[myCubit.selectedIndex],
            bottomNavigationBar: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                HomeCubit myCubit = BlocProvider.of(context);
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(.1),
                      )
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: GNav(
                        rippleColor: Colors.grey[300]!,
                        hoverColor: Colors.grey[100]!,
                        gap: 8,
                        activeColor: Colors.deepOrange,
                        iconSize: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        duration: Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey[100]!,
                        color: Colors.black,
                        tabs: [
                          GButton(
                            icon: Icons.home,
                            leading: SvgPicture.asset(
                              "Icons/home.svg",
                              width: 25,
                              color: myCubit.selectedIndex == 0
                                  ? Colors.deepOrange
                                  : Colors.black,
                            ),
                            text: 'Home',
                          ),
                          GButton(
                            icon: Icons.newspaper_outlined,
                            text: 'Home',
                          ),
                          GButton(
                            icon: Icons.home,
                            leading: SvgPicture.asset(
                              "Icons/settings.svg",
                              width: 25,
                              color: myCubit.selectedIndex == 2
                                  ? Colors.deepOrange
                                  : Colors.black,
                            ),
                            text: 'Home',
                          ),
                        ],
                        selectedIndex: myCubit.selectedIndex,
                        onTabChange: (index) {
                          myCubit.onTap(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
