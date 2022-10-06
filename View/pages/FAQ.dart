import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/View_model/Bloc/FAQ/faq_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';

//HTML.toTextSpan(context, htmlContent)
class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getData(),
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
            "FAQ",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<FaqCubit, FaqState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            FaqCubit myCubit = BlocProvider.of(context);
            return myCubit.modelData == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: InkWell(
                            onTap: () {
                              myCubit.Change();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )),
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: HTML.toRichText(context,
                                          myCubit.modelData!.data![0].question!,
                                          defaultTextStyle:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    Icon(
                                      myCubit.isOpened
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )),
                            height: myCubit.isOpened ? 60 : 0,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: HTML.toRichText(
                                              context,
                                              myCubit
                                                  .modelData!.data![0].answer!,
                                              defaultTextStyle: TextStyle(
                                                  color: Colors.white)))),
                                ],
                              ),
                            ),
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
