import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/Section_model.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());

  String? Sub_Name;
  String? StartTime;
  String? EndTime;
  String? Date;

  SectionModel ? modelData;

  void getData(){
    DioHelper.getData(url: sectionEndPoint,token:Token).then((value) async{
      modelData = await SectionModel.fromJson(value.data);

      emit(SectionData());
    });
  }

  static SectionCubit get(context) => BlocProvider.of(context);
}
