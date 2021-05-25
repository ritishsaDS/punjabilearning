import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/constant/Messages.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/ui/activities/StoryDetail.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class StoriesListingScreen extends StatefulWidget {
  StoriesListingScreen({Key key, this.title, this.detail}) : super(key: key);
  final String title;
  final List<Content> detail;
  @override
  _StoriesListingScreenState createState() => _StoriesListingScreenState();
}

class _StoriesListingScreenState extends State<StoriesListingScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return /*Container(  decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/fatti_detail.png"),
            fit: BoxFit.fill)),child:*/
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                child: Stack(
              children: [
                Image.asset(
                  "assets/story_bg.png",
                  fit: BoxFit.fill,
                  height: SizeConfig.blockSizeVertical * 100,
                  width: SizeConfig.blockSizeHorizontal * 100,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 4.5,
                      top: SizeConfig.blockSizeVertical * 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2.75),
                          child: Icon(
                            Icons.arrow_back_sharp,
                            size: SizeConfig.blockSizeVertical * 4,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 4),
                        child: Text(
                          "ਕਹਾਣੀਆਂ",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 6,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 59.2,
                        width: SizeConfig.blockSizeHorizontal * 100,
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 16),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 6),
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing:
                                        SizeConfig.blockSizeHorizontal * 4,
                                    mainAxisSpacing:
                                        SizeConfig.blockSizeVertical * 3,
                                    childAspectRatio: 1.34),
                            itemCount: widget.detail.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              StoriesDetailScreen(
                                                title: widget.detail
                                                    .elementAt(index)
                                                    .name,
                                                storydetail: widget.detail
                                                    .elementAt(index),
                                              )));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            width: 1.5, color: logincolor)),
                                    height: SizeConfig.blockSizeVertical * 12,
                                    width: SizeConfig.blockSizeHorizontal * 32,
                                    child: Column(
                                      children: [
                                        Container(
                                            child: CachedNetworkImage(
                                          imageUrl: widget.detail
                                              .elementAt(index)
                                              .image,
                                          height: SizeConfig.blockSizeVertical *
                                              9.1,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  30,
                                        )),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(6.0),
                                                  topLeft: Radius.circular(6.0),
                                                  bottomLeft:
                                                      Radius.circular(6.0),
                                                  bottomRight:
                                                      Radius.circular(6.0)),
                                              color: logincolor),
                                          padding: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  1.75),
                                          height: SizeConfig.blockSizeVertical *
                                              4.585,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  42,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    20,
                                                child: Text(
                                                    widget.detail
                                                        .elementAt(index)
                                                        .name,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .blockSizeVertical *
                                                            1.9,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
