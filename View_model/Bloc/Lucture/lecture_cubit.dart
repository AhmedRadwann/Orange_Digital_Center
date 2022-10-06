import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/Lecture_model.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';

part 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(LectureInitial());
  String? Sub_Name;
  String? StartTime;
  String? EndTime;
  String? Date;

  LectureModel ? modelData;

  void getData(){
    DioHelper.getData(url: lectureEndPoint,token:Token).then((value) async{
      modelData = await LectureModel.fromJson(value.data);

      emit(LectureData());
    });
  }

  static LectureCubit get(context) => BlocProvider.of(context);
}
