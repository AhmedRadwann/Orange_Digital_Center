import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController note = TextEditingController();


  static NoteCubit get(context) => BlocProvider.of(context);

}
