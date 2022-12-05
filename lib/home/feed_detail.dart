import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../splash/splash.dart';
import '../utils/image_loader.dart';

class FeedDetail extends StatefulWidget {
  final String description;
  final DateTime date;
  String? fileUrl;

  FeedDetail({
    Key? key,
    required this.description,
    this.fileUrl,
    required this.date,
  }) : super(key: key);

  @override
  State<FeedDetail> createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.transparent,
            leading: Container(
              // margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            // title: Text(cart.items.length.toString()),
            snap: true,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Admin@UGRUSSA",
                style: TextStyle(
                  fontSize: 15,
                ),
              ), //Text
              background: widget.fileUrl != null ? Container(
                alignment: Alignment.topLeft,
                // height: 300,
                width: double.infinity,
                // margin: EdgeInsets.all(10),
                child: ImageLoader(
                  url: widget.fileUrl!,
                  imageHeight: 300,
                  imageWidth: double.infinity,
                  spinnerHeight: 25,
                  spinnerWidth: 25,
                ),
              ): Container(),
            ),
            //FlexibleSpaceBar
            expandedHeight: 200,
            //IconButton
          ),
          SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.height * 1,
            delegate: SliverChildListDelegate(
              [
                Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  color: Color(0xffffffff),
                                ),
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                'assets/images/logo.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 5),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1),
                                                  child: Text(
                                                    'Admin@UGRUSSA',
                                                    style: TextStyle(
                                                      color: Color(0xff575858),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1),
                                                  child: Text(
                                                    DateFormat.yMMMMEEEEd()
                                                        .format(
                                                      widget.date,
                                                    ),
                                                    style: TextStyle(
                                                      color: Color(0xffc8cbcd),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                width: 350,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    widget.description,
                                    style: TextStyle(
                                      color: Color(0xff575858),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   height: 250,
                              //   width: double.infinity,
                              //   margin: EdgeInsets.all(10),
                              //   child: ImageLoader(
                              //     url: fileUrl,
                              //     imageHeight: 250,
                              //     imageWidth: double.infinity,
                              //     spinnerHeight: 25,
                              //     spinnerWidth: 25,
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
