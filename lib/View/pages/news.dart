import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc/View/pages/ODCs_support.dart';
import 'package:odc/View_model/Bloc/News/news_cubit.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => NewsCubit()..getData(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white38,
            elevation: 0,
            title: Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          body: BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              NewsCubit myCubit = BlocProvider.of(context);
              return myCubit.modelData == null
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 250,
                                    child: Card(
                                      color: Colors.grey[350],
                                      elevation: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 15, 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${myCubit.modelData!.data![0].title}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 60,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          InkWell(
                                                            child: SvgPicture
                                                                .asset(
                                                              "Icons/share.svg",
                                                              height: 25,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onTap: () {
                                                              Share.share(
                                                                  "${myCubit.modelData!.data![0].linkUrl}");
                                                            },
                                                          ),
                                                          Container(
                                                            width: 0.5,
                                                            height: 20,
                                                            color: Colors.white,
                                                          ),
                                                          InkWell(
                                                            child: SvgPicture
                                                                .asset(
                                                              "Icons/copy.svg",
                                                              height: 25,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onTap: () {
                                                              Clipboard.setData(ClipboardData(
                                                                  text: myCubit!
                                                                      .modelData!
                                                                      .data![0]!
                                                                      .linkUrl!));
                                                              showTopSnackBar(
                                                                context,
                                                                const CustomSnackBar
                                                                    .success(
                                                                  message:
                                                                      "Copied Success",
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blueAccent,
                                                                ),
                                                                displayDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Image.asset("image/logo.png"),
                                            Row(
                                              children: [
                                                Text(
                                                  '${myCubit.modelData!.data![0].body}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ods(
                                              myCubit!
                                                  .modelData!.data![0]!.title!,
                                              myCubit!.modelData!.data![0]!
                                                  .imageUrl!,
                                              myCubit!
                                                  .modelData!.data![0]!.date!,
                                              myCubit!
                                                  .modelData!.data![0]!.body!,
                                            )));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      );
}
