import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/news_model.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {

  NewsCubit() : super(NewsInitial());


  news_model ? modelData;

  void getData(){
    DioHelper.getData(url: newsEndPoint,token:Token).then((value) async{
      modelData = await news_model.fromJson(value.data);
      emit(newsChange());
    });
  }

  static NewsCubit get(context)=>BlocProvider.of(context);
}
