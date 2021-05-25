import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/data/repo/FattiRepo.dart';
import 'package:flutter_punjabilearning/data/repo/Logout.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/FeaturesEntity.dart';
import 'package:flutter_punjabilearning/ui/activities/Fatti.dart';
import 'package:flutter_punjabilearning/ui/activities/LoginScreen.dart';
import 'package:flutter_punjabilearning/ui/activities/Numbers.dart';
import 'package:flutter_punjabilearning/ui/activities/ProfileScreen.dart';
import 'package:flutter_punjabilearning/ui/activities/QuizScoreScreen.dart';
import 'package:flutter_punjabilearning/ui/activities/SpellingDetails.dart';
import 'package:flutter_punjabilearning/ui/activities/StoriesListing.dart';
import 'package:flutter_punjabilearning/ui/activities/Word.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'wordnew.dart';
import 'package:flutter_punjabilearning/ui/activities/fattigrid.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SharedPref.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  bool isloading = false;
  String token = "";
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var fatti = FattiRepo();
  var logout = LogoutRepo();
  var applogo = "";
  var sortedlist = new List<Content>();
  List<FeaturesEntity> features = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    features
        .add(new FeaturesEntity("ALPHABET TABLET", "ਫੱਟੀ", "assets/alpha.png"));
    features.add(new FeaturesEntity("ALPHABET", "ਅੱਖਰ", "assets/alpha2.png"));
    features.add(new FeaturesEntity("NUMBERS", "ਗਿਣਤੀ", "assets/ank.png"));
    features.add(
        new FeaturesEntity("SPELLINGS", "ਸਪੈਲਿੰਗਜ਼", "assets/shabdjod.png"));
    features
        .add(new FeaturesEntity("VOWELS", "ਲਗਾ ਮੱਤਰਾ", "assets/vowels.png"));
    features
        .add(new FeaturesEntity("STORIES", "ਕਹਾਣੀਆਂ", "assets/stories.png"));
    features.add(new FeaturesEntity("QUIZ", "ਕਵਿਜ਼", "assets/1.png"));
    SharedPreferencesTest().applogo("1", "value").then((value) {
      setState(() {
        applogo = value;
      });
    });
    // SharedPreferencesTest().accesstoken("1", "token").then((val) {
    //   setState(() {
    //     token = val;
    //     SharedPreferencesTest().applogo("1", "value").then((value) {
    //       applogo = value;
    //       print(applogo);
    //     });
    //   });
    //   print(token);
    //   isloading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child = Container(
      height: SizeConfig.blockSizeVertical * 100,
      width: SizeConfig.blockSizeHorizontal * 100,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.0),
                  topLeft: Radius.circular(7.0),
                  bottomLeft: Radius.circular(7.0),
                  bottomRight: Radius.circular(7.0)),
              color: logincolor),
          height: SizeConfig.blockSizeVertical * 5.5,
          width: SizeConfig.blockSizeHorizontal * 100,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 7),
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  child: Icon(
                Icons.thumb_up,
                size: SizeConfig.blockSizeVertical * 3.5,
                color: Colors.white,
              )),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  child: Icon(
                    Icons.description_sharp,
                    size: SizeConfig.blockSizeVertical * 3.5,
                    color: Colors.white,
                  )),
              InkWell(
                  child: Icon(
                Icons.share_sharp,
                size: SizeConfig.blockSizeVertical * 3.5,
                color: Colors.white,
              )),
              InkWell(
                  child: Icon(
                Icons.info_outlined,
                size: SizeConfig.blockSizeVertical * 3.5,
                color: Colors.white,
              )),
              InkWell(
                  onTap: () {
                    setState(() {
                      isloading = true;
                    });
                    logout.logout(token, context).then((value) async {
                      setState(() {
                                                print("skdmkllk"+value.success.toString());

                        // isloading = false;
                      });
                      if (value.success) {
                        Fluttertoast.showToast(msg: "Logout Successfully");
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        //  print( prefs.getString("login")+"lknlknksnalk");
                        // prefs.setString("login", "false");
                        print("skdmkllk"+value.success.toString());
                        SharedPreferencesTest().checkIsLogin("5");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                      } else {
                        isloading = false;
                        Fluttertoast.showToast(msg: "Something went Wrong!");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                      }
                    }).catchError((onError) {
                      setState(() {
                        print(onError);
                        isloading = false;
                      });
                    });
                  },
                  child: Icon(
                    Icons.logout,
                    size: SizeConfig.blockSizeVertical * 3.5,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/homelogo.png",
                        fit: BoxFit.fill,
                        height: SizeConfig.blockSizeVertical * 28,
                        width: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2.75,
                              top: SizeConfig.blockSizeVertical * 5.25),
                          child:
                              /*Image.asset(widget.fattidetail.image,fit: BoxFit.fill,width: SizeConfig.blockSizeHorizontal*59.25,
                                height: SizeConfig.blockSizeVertical*30,*/
                              CachedNetworkImage(
                                  imageUrl: applogo,
                                  fit: BoxFit.fill,
                                  width: SizeConfig.blockSizeHorizontal * 24,
                                  height:
                                      SizeConfig.blockSizeVertical * 12.75)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProfileScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 5.75,
                          left: SizeConfig.blockSizeHorizontal * 32),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: logincolor),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6.0),
                            topLeft: Radius.circular(6.0),
                            bottomLeft: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0)),
                      ),
                      child: Icon(
                        Icons.person,
                        color: logincolor,
                        size: SizeConfig.blockSizeVertical * 6.1,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 66,
                width: SizeConfig.blockSizeHorizontal * 100,
                margin:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.5),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: SizeConfig.blockSizeHorizontal * 5,
                        mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
                        childAspectRatio: 1.48),
                    itemCount: features.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            setState(() {
                              isloading = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Fattigrid()));
                            // fatti
                            //     .getfatti(token, "Content", context)
                            //     .then((value) {
                            //   setState(() {
                            //     isloading = false;
                            //   });
                            //   if (value.code == 200) {
                            //     sortedlist = value.content;
                            //     sortedlist.sort((a, b) {
                            //       return a.id.compareTo(b.id);
                            //     });

                            //   } else {
                            //     showAlertDialog(
                            //         context, "Data not Found", "type");
                            //   }
                            // }).catchError((onError) {
                            //   setState(() {
                            //     isloading = false;
                            //   });
                            // });
                          } else if (index == 1) {
                            setState(() {
                              isloading = true;
                            });
                            fatti
                                .getfatti(token, "Content", context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if (value.code == 200) {
                                sortedlist = value.content;
                                sortedlist.sort((a, b) {
                                  return a.id.compareTo(b.id);
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            FattiScreen(
                                              title: "ਅੱਖਰ",
                                              detail: value.content,
                                              index: index,
                                            )));
                              } else {
                                showAlertDialog(
                                    context, "Data not Found", "type");
                              }
                            }).catchError((onError) {
                              setState(() {
                                isloading = false;
                              });
                            });
                          } else if (index == 2) {
                            setState(() {
                              isloading = true;
                            });
                            fatti
                                .getfatti(token, "Number", context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if (value.code == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            NumbersScreen(
                                              title: "ਗਿਣਤੀ",
                                              detail: value.content,
                                              index: index,
                                            )));
                              } else {
                                showAlertDialog(
                                    context, "Data not Found", "type");
                              }
                            }).catchError((onError) {
                              setState(() {
                                isloading = false;
                              });
                            });
                          } else if (index == 3) {
                            setState(() {
                              isloading = true;
                            });
                            fatti
                                .getfatti(token, "Spelling", context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if (value.code == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SpellingDetailScreen(
                                              title: "ਸਪੈਲਿੰਗਜ਼",
                                              fattidetail: value.content,
                                            )));
                              } else {
                                showAlertDialog(
                                    context, "Data not Found", "type");
                              }
                            }).catchError((onError) {
                              setState(() {
                                isloading = false;
                              });
                            });
                          } else if (index == 4) {
                            //  Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (BuildContext context) =>
                            //                 Wordnew(
                            //                   title:"ਲਗਾ ਮੱਤਰਾ"
                            //                 )));
                            print(index);
                            setState(() {
                              isloading = true;
                            });
                            fatti
                                .getfatti(token, "Lipi", context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if (value.code == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Wordnew(
                                              title: "ਲਗਾ ਮੱਤਰਾ",
                                            )));
                              } else {
                                showAlertDialog(
                                    context, "Data not Found", "type");
                              }
                            }).catchError((onError) {
                              setState(() {
                                isloading = false;
                              });
                            });
                          } else if (index == 5) {
                            setState(() {
                              isloading = true;
                            });
                            fatti
                                .getfatti(token, "Khani", context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if (value.code == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            StoriesListingScreen(
                                              title: "ਕਹਾਣੀਆਂ",
                                              detail: value.content,
                                            )));
                              } else {
                                showAlertDialog(
                                    context, "Data not Found", "type");
                              }
                            }).catchError((onError) {
                              setState(() {
                                isloading = false;
                              });
                            });
                          } else if (index == 6) {
                            setState(() {
                              isloading = true;
                            });
                            fatti
                                .getfatti(token, "Content", context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });
                              if (value.code == 200) {
                                sortedlist = value.content;
                                sortedlist.sort((a, b) {
                                  return a.id.compareTo(b.id);
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            QuizScreen()));
                              } else {
                                showAlertDialog(
                                    context, "Data not Found", "type");
                              }
                            }).catchError((onError) {
                              setState(() {
                                isloading = false;
                              });
                            });
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(width: 1.5, color: logincolor)),
                            height: SizeConfig.blockSizeVertical * 12,
                            width: SizeConfig.blockSizeHorizontal * 32,
                            child: Stack(
                              children: [
                                Container(
                                    child: Image.asset(
                                  features.elementAt(index).image,
                                  fit: BoxFit.fill,
                                  height: SizeConfig.blockSizeVertical * 11,
                                  width: SizeConfig.blockSizeHorizontal * 46,
                                )),
                                Container(
                                  margin: EdgeInsets.only(
                                      top:
                                          SizeConfig.blockSizeVertical * 9.025),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6.0),
                                          topLeft: Radius.circular(6.0),
                                          bottomLeft: Radius.circular(6.0),
                                          bottomRight: Radius.circular(6.0)),
                                      color: logincolor),
                                  padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 1.75,
                                      right: SizeConfig.blockSizeHorizontal *
                                          1.75),
                                  height: SizeConfig.blockSizeVertical * 4.585,
                                  width: SizeConfig.blockSizeHorizontal * 42,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(features.elementAt(index).punjabi,
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2.25,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1.65),
                                          child: Text(
                                            features.elementAt(index).english,
                                            style: TextStyle(
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1.2,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

    widgetList.add(child);
    if (isloading) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(appColorPrimary),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }

    return
        /* WillPopScope(
            onWillPop: ,
            child:*/
        Stack(children: widgetList);
  }
}
