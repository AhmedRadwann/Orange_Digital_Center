import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/View/pages/home.dart';
import 'package:odc/View/pages/home_layout.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:odc/SharedPrefrence.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Color emailcolor=Colors.grey;
  Color passwordcolor=Colors.grey;
  bool email_press=false;
  bool password_press=false;
  bool IsShowed=true;


  void Toggle_email(){
    email_press?emailcolor=Colors.deepOrange:emailcolor=Colors.grey;
    emit(EmailChangeState());
  }


  void Toggle_password(){
    password_press?passwordcolor=Colors.deepOrange:passwordcolor=Colors.grey;
    emit(PasswordChangeState());
  }

  void Change_Obsecure() {
    IsShowed = !IsShowed;
    emit(ObsecureChangeState());
  }

  void login(context) {
    var json = {
      "email": email.text.toString(),
      "password": password.text.toString()
    };
    emit(loatState());
    DioHelper.postData(url: loginEndPoint, data: json).then((value) async{
      if (value.statusCode == 200) {
        Token = value.data['data']['accessToken'];
        if (Token != "" && Token != null ) {
          CacheHelper.saveData(key: "Token", value: value.data['data']['accessToken']).then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeLayOut(),
              )));
          showTopSnackBar(
            context, const CustomSnackBar.success(
            message:
            "Welcome Back",
          ),
            displayDuration: Duration(milliseconds: 200),
          );
        }else{
           debugPrint("Token error");
        }
        emit(LoginSuccess());
      }
    }).catchError((e) {
      showTopSnackBar(
        context, const CustomSnackBar.error(
        message:
        "Email or Password isn't Correct",
      ),
        displayDuration: Duration(milliseconds: 200),
      );
      Navigator.pop(context);
      emit(LoginError());
    });
  }
  static LoginCubit get(context)=>BlocProvider.of(context);
}
