import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/View/componant/Core/CustomFormFiled.dart';
import 'package:odc/View/pages/login.dart';
import 'package:odc/View_model/Bloc/Signup/signup_cubit.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset(
                    "image/logo.png",
                    height: 40,
                    width: 250,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    SignupCubit myCubit = BlocProvider.of(context);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomFormFiled(
                            title: 'Name',
                            FormColor: myCubit.Namecolor,
                            controller: myCubit.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomFormFiled(
                            FormColor: myCubit.emailcolor,
                            title: 'E-mail',
                            controller: myCubit.email,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomFormFiled(
                            FormColor: myCubit.passwordcolor,
                            title: 'Password',
                            isPassword: true,
                            controller: myCubit.password,
                            obsecure: myCubit.PasswordIsShowed,
                            changeObsecure: () {
                              myCubit.Change_Obsecure_password();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomFormFiled(
                            FormColor: myCubit.repasswordcolor,
                            title: 'RePassword',
                            isPassword: true,
                            controller: myCubit.repassword,
                            obsecure: myCubit.rePasswordIsShowed,
                            changeObsecure: () {
                              myCubit.Change_Obsecure_repassword();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomFormFiled(
                            FormColor: myCubit.phonecolor,
                            title: 'Phone',
                            controller: myCubit.phone,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    "Gender",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 1), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: DropdownButton(
                                      value: myCubit.GenderValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      items: myCubit.Gander.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        myCubit.changeGender(newValue);
                                      },
                                      underline: Container(),
                                      borderRadius: BorderRadius.circular(10),
                                      iconEnabledColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    "University",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 1), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: DropdownButton(
                                      value: myCubit.UniversalValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      items: myCubit.Universities.map(
                                          (String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        myCubit.changeUniversity(newValue);
                                      },
                                      underline: Container(),
                                      borderRadius: BorderRadius.circular(10),
                                      iconEnabledColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    "Grade",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 1), //border of dropdown button
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: DropdownButton(
                                      value: myCubit.GradeValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      items: myCubit.Grade.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        myCubit.changeGrade(newValue);
                                      },
                                      underline: Container(),
                                      borderRadius: BorderRadius.circular(10),
                                      iconEnabledColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                myCubit.signup(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.deepOrange,
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                "OR",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(
                                    width: 1, color: Colors.deepOrange),
                                backgroundColor: Colors.white,
                                elevation: 0,
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
