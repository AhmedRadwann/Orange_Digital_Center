import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/Terms_model.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  TermsModel ? modelData;

  void getData(){
    DioHelper.getData(url: termsEndPoint,token:Token).then((value) async{
      modelData = await TermsModel.fromJson(value.data);
      emit(termChange());
    });
  }

  static TermsCubit get(context)=>BlocProvider.of(context);
}
