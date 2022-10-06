import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  void nav(Widget Screen,context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen));
    emit(ChangeScreen());
  }
  static SettingCubit get(context)=>BlocProvider.of(context);
}
