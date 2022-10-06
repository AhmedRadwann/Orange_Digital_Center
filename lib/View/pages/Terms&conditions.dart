import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/View_model/Bloc/Terms/terms_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';

class terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Terms & Conditions",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<TermsCubit, TermsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            TermsCubit myCubit = BlocProvider.of(context);
            return myCubit.modelData == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ))
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40.0, 10, 30, 0),
                          child: HTML.toRichText(
                            context,
                            myCubit.modelData!.data!.terms.toString(),
                            defaultTextStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
