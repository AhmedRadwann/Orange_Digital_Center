import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/View/componant/Core/CustomFormFiled.dart';
import 'package:odc/View/pages/Singup.dart';
import 'package:odc/View/pages/home.dart';
import 'package:odc/View_model/Bloc/Login/login_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset(
                      "image/logo.png",
                      height: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22.0, 22, 22, 0),
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is loatState) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: Container(
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            color: Colors.deepOrange,
                                          ),
                                        ],
                                      ),
                                    ),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.5),
                                  ));
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        LoginCubit myCubit = LoginCubit.get(context);

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: CustomFormFiled(
                                controller: myCubit.email,
                                FormColor: myCubit.emailcolor,
                                title: 'Email',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: CustomFormFiled(
                                controller: myCubit.password,
                                isPassword: true,
                                FormColor: myCubit.passwordcolor,
                                title: 'Password',
                                obsecure: myCubit.IsShowed,
                                changeObsecure: () {
                                  myCubit.Change_Obsecure();
                                },
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forget Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.deepOrange,
                                  ),
                                )),
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  myCubit.login(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
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
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
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
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
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
        ),
      );
}
