import 'package:flutter/material.dart';
import 'package:odc/Constant.dart';
import 'package:odc/SharedPrefrence.dart';
import 'package:odc/View/pages/Splash.dart';
import 'package:odc/View/pages/home_layout.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';


Future<void> main() async{
  WidgetsFlutterBinding();
  await DioHelper.init();
  await CacheHelper.init();
  Token=CacheHelper.getData(key: "Token");
  runApp(MyApp(Token!=null?HomeLayOut():splash()));
}




