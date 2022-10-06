import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/Constant.dart';
import 'package:odc/Model/university_model.dart';
import 'package:odc/View/pages/login.dart';
import 'package:odc/View_model/DataBase/network/dio_helper.dart';
import 'package:odc/View_model/DataBase/network/end_points.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  String GenderValue = 'Male';
  String UniversalValue = 'AUC';
  String GradeValue = 'Grade 1';
  var Gander = [
    'Male',
    'Female',
  ];
  var Universities = [
    'AUC',
    'Cairo',
    'ELU',
    'GUC',
    'Helwan',
    'HTi',

  ];

  var Grade = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
  ]
  ;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController repassword = TextEditingController();

  Color emailcolor=Colors.grey;
  Color passwordcolor=Colors.grey;
  Color Namecolor=Colors.grey;
  Color phonecolor=Colors.grey;
  Color repasswordcolor=Colors.grey;


  bool email_press=false;
  bool password_press=false;
  bool name_press=false;
  bool prepassword_press=false;
  bool phone_press=false;

  bool PasswordIsShowed=true;
  bool rePasswordIsShowed=true;


  void Toggle_email(){
    email_press?emailcolor=Colors.deepOrange:emailcolor=Colors.grey;
    emit(EmailState());
  }


  void Toggle_password(){
    password_press?passwordcolor=Colors.deepOrange:passwordcolor=Colors.grey;
    emit(PasswordState());
  }

  void Toggle_repassword(){
    prepassword_press?repasswordcolor=Colors.deepOrange:repasswordcolor=Colors.grey;
    emit(rePasswordState());
  }

  void Toggle_phone(){
    phone_press?phonecolor=Colors.deepOrange:phonecolor=Colors.grey;
    emit(phoneState());
  }
  void Toggle_name(){
    name_press?Namecolor=Colors.deepOrange:Namecolor=Colors.grey;
    emit(nameState());
  }


  void Change_Obsecure_password() {
    PasswordIsShowed = !PasswordIsShowed;
    emit(ObsecurePasswordState());
  }
  void Change_Obsecure_repassword() {
    rePasswordIsShowed = !rePasswordIsShowed;
    emit(ObsecurerePasswordState());
  }

  void changeGender(var Val){
    GenderValue = Val;
    emit(GenderChange());
  }

  void changeUniversity(var Val){
    UniversalValue = Val;
    emit(UniversityChange());
  }

  void changeGrade(var Val){
    GradeValue = Val;
    emit(GradeChange());
  }

  void signup(context) {
    var json = {
      "email": email.text.toString(),
      "password": password.text.toString(),
      "name":name.text.toString(),
      "gender":GenderValue[0].toLowerCase(),
      "phoneNumber":phone.text.toString(),
      "universityId":1,
      "gradeId":4,
      "roleId":1,
    };
    DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      showTopSnackBar(
        context, const CustomSnackBar.success(
        message:
        "Thank you, Email Created",
      ),
        displayDuration: Duration(milliseconds: 200),
      );
      Navigator.push(context,MaterialPageRoute(
          builder: (context) => Login()));
        emit(LoginSuccess());
      }).catchError((e) {
      showTopSnackBar(
        context, const CustomSnackBar.error(
        message:
        "Error, Creating Email",
      ),
        displayDuration: Duration(milliseconds: 200),
      );
      emit(LoginError());
    });
  }


  static SignupCubit get(context)=>BlocProvider.of(context);
}
