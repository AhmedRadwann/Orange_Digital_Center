import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/midterm_model.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';

part 'midterm_state.dart';

class MidtermCubit extends Cubit<MidtermState> {
  MidtermCubit() : super(MidtermInitial());

  String? Sub_Name;
  String? StartTime;
  String? EndTime;
  String? Date;

  midterm_model ? modelData;

  void getData(){
    DioHelper.getData(url: examsEndPoint,token:Token).then((value) async{
      modelData = await midterm_model.fromJson(value.data);

      emit(MidtermData());
    });
  }

  static MidtermCubit get(context) => BlocProvider.of(context);
}
