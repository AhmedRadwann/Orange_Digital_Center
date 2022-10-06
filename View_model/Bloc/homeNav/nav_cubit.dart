import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());
  void nav(Widget Screen,context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen));
    emit(ChangeScreen());
  }
  static NavCubit get(context)=>BlocProvider.of(context);
}
