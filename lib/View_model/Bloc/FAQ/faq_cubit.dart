import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/faq_model.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {

  FaqCubit() : super(FaqInitial());

  bool isOpened = false;

  void Change(){
    isOpened=!isOpened;
    emit(ChangeState());
  }

  faq_model ? modelData;

  void getData(){
    DioHelper.getData(url: faqEndPoint,token:Token).then((value) async{
      modelData = await faq_model.fromJson(value.data);
      emit(faqData());
    });
  }

  static FaqCubit get(context)=>BlocProvider.of(context);
}
