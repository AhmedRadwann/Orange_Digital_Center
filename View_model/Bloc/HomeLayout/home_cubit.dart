import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/View/pages/Setting.dart';
import 'package:odc/View/pages/home.dart';
import 'package:odc/View/pages/news.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> widgetOptions = <Widget>[
    home(),
    News(),
    Setting(),
  ];

  void onTap(index){
    selectedIndex = index;
    emit(NewState());
  }
  static HomeCubit get(context)=>BlocProvider.of(context);
}
