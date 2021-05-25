import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/data/repo/GetProfileRepo.dart';
import 'package:flutter_punjabilearning/data/repo/LoginUser.dart';
import 'package:flutter_punjabilearning/data/repo/UpdateProfile.dart';
import 'package:flutter_punjabilearning/models/UserProfile.dart';
import 'package:flutter_punjabilearning/utils/ActionSheet.dart';
import 'package:flutter_punjabilearning/utils/SharedPref.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:images_picker/images_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var _image;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  var loginrepo = LoginUserRepo();
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var applogo = "";
  final TextEditingController nameCont = new TextEditingController();
  bool cobscureText = true;
  var confirmCont = TextEditingController();
  final GlobalKey<State> registerloader = new GlobalKey<State>();
  var emailFocus = FocusNode();
  var confmFocus = FocusNode();
  var getprofile = GetProfileRepo();
  var updateprofile = UpdateProfileRepo();
  var isloading = false;
  String token = "";
  UserProfile profile = new UserProfile();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = true;
    getValue();
  
    SharedPreferencesTest().accesstoken("1", "token").then((val) {
      token = val;
      getprofile.getprofile(token, context).then((value) {
        setState(() {
          isloading = false;
          profile = value;
          print("knflksmldldsfl");
          print(value);
          //    print("dsdfsf"+profile.user.phoneNumber);
          passCont.text = profile.user.phoneNumber;
          nameCont.text = profile.user.name;

        });
      }).catchError((onError) {
        setState(() {
          isloading = false;
          print(onError);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child = Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: logincolor,
        automaticallyImplyLeading: true,
        title: Text(
          "PROFILE",
          style: TextStyle(
              fontSize: SizeConfig.blockSizeVertical * 3,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 6),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 4),
                            child: _image == null || _image == ""
                                ? CircleAvatar(
                                    radius: SizeConfig.blockSizeHorizontal * 17,
                                    backgroundColor: logincolor,
                                    backgroundImage: CachedNetworkImageProvider(
                                        profile != null
                                            ? profile.user != null
                                                ? profile.user.profilePic
                                                : ""
                                            : ""))
                                : CircleAvatar(
                                    radius: SizeConfig.blockSizeHorizontal * 17,
                                    backgroundColor: logincolor,
                                    backgroundImage: FileImage(File(
                                        _image != null ? _image.path : "")))),
                        InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) => ActionSheet()
                                        .actionSheet(context, onCamera: () {
                                      FocusScope.of(context).unfocus();
                                      chooseCameraFile().then((File file) {
                                        if (file != null) {
                                          setState(() {
                                            //   loading = true;
                                          });
                                        }
                                      }).catchError((onError) {});
                                    }, onGallery: () {
                                      FocusScope.of(context).unfocus();
                                      if (Platform.isAndroid) {
                                        androidchooseImageFile().then((value) {
                                          setState(() {
                                            //  loading = true;
                                          });
                                        }).catchError((onError) {});
                                      } else {
                                        chooseImageFile().then((File file) {
                                          if (file != null) {
                                            setState(() {
                                              //  loading = true;
                                            });
                                          }
                                        }).catchError((onError) {});
                                      }
                                    }));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 4.5),
                            width: SizeConfig.blockSizeHorizontal * 33,
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: logincolor,
                                child: Icon(
                                  Icons.edit_outlined,
                                  size: 18.5,
                                  color: Colors.white,
                                ),
                                radius: 15.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 6,
                        left: SizeConfig.blockSizeVertical * 1,
                        right: SizeConfig.blockSizeHorizontal * 1),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.05,
                          fontWeight: FontWeight.w600,
                          color: logincolor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 0.7,
                        left: SizeConfig.blockSizeVertical * 1,
                        right: SizeConfig.blockSizeHorizontal * 1),
                    child: TextFormField(
                      controller: nameCont,
                      cursorColor: logincolor,
                      style: TextStyle(fontSize: 16.0),
                      showCursor: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: "Name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: translogincolor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: logincolor, width: 1.5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: logincolor, width: 1.25)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (s) {
                        if (s.trim().isEmpty) return "Name is required";
                        return null;
                      },
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(emailFocus),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeVertical * 1,
                        right: SizeConfig.blockSizeHorizontal * 1),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.05,
                          fontWeight: FontWeight.w600,
                          color: logincolor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 0.7,
                        left: SizeConfig.blockSizeVertical * 1,
                        right: SizeConfig.blockSizeHorizontal * 1),
                    child: TextFormField(
                      controller: emailCont,
                      focusNode: emailFocus,
                      cursorColor: logincolor,
                      style: TextStyle(fontSize: 16.0),
                      showCursor: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: translogincolor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: logincolor, width: 1.5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: logincolor, width: 1.25)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (s) {
                        if (s.trim().isEmpty) return "Email is required";
                        if (!validateEmail(s)) return 'Email is invalid';
                        return null;
                      },
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(passFocus),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeVertical * 1,
                        right: SizeConfig.blockSizeHorizontal * 1),
                    child: Text(
                      'Phone',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.15,
                          fontWeight: FontWeight.w600,
                          color: logincolor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 0.7,
                        left: SizeConfig.blockSizeVertical * 1,
                        right: SizeConfig.blockSizeHorizontal * 1),
                    child: TextFormField(
                      obscureText: false,
                      focusNode: passFocus,
                      cursorColor: logincolor,
                      controller: passCont,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: logincolor, width: 1.5)),
                        hintText: "Phone",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: translogincolor),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: logincolor, width: 1.25)),
                      ),
                      validator: (s) {
                        if (s.trim().isEmpty) return "Phone is Required";
                        return null;
                      },
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).requestFocus(confmFocus),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        setState(() {
                          isloading = true;
                        });
                        updateprofile
                            .updateprofile(
                                token,
                                nameCont.text.toString(),
                                emailCont.text.toString(),
                                passCont.text.toString(),
                                _image,
                                context)
                            .then((value) {
                          setState(() {
                            print(token);
                            isloading = false;
                          });
                          toast("Profile Updated Successfully!");
                          Navigator.pop(context);
                        }).catchError((onError) {
                          setState(() {
                            isloading = false;
                          });
                          toast("Something went Wrong!");
                        });
                      } else {
                        autoValidate = true;
                      }
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 100,
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 7,
                            left: SizeConfig.blockSizeHorizontal * 1,
                            right: SizeConfig.blockSizeHorizontal * 1),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 1.3,
                        ),
                        decoration: BoxDecoration(
                            color: logincolor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: defaultBoxShadow()),
                        child: Text(
                          'UPDATE',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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

  bool validateEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  Future<File> chooseCameraFile() async {
    /*await ImagePicker().getImage(source: ImageSource.camera).then((image) {
          setState(() {
            _image = image;
          });
        });*/
    await ImagesPicker.openCamera(pickType: PickType.image, maxTime: 30)
        .then((value) {
      setState(() {
        FocusScope.of(context).unfocus();
        _image = new File(value.elementAt(0).path);
      });
    }).catchError((error) {
      print(error.toString());
    });
    return _image;
  }

  Future<File> chooseImageFile() async {
    await ImagesPicker.pick(count: 1, pickType: PickType.image).then((value) {
      setState(() {
        FocusScope.of(context).unfocus();
        _image = new File(value.elementAt(0).path);
      });
    }).catchError((error) {
      print(error.toString());
    });
    return _image;
  }

  Future<void> androidchooseImageFile() async {
    await await MultiImagePicker.pickImages(
      maxImages: 1,
      enableCamera: false,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#0A79DF",
        actionBarTitle: "Smart Trucker",
        allViewTitle: "All Photos",
        useDetailsView: false,
        selectionLimitReachedText: "Please select 1 images at a time",
        selectCircleStrokeColor: "#0A79DF",
      ),
    ).then((value) {
      setState(() async {
        FocusScope.of(context).unfocus();
        for (int i = 0; i < value.length; i++) {
          var path = await FlutterAbsolutePath.getAbsolutePath(
              value.elementAt(i).identifier);
          _image = new File(path);
        }
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<void> getValue() async {
    isloading = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("jekjljnll" + prefs.getString("email"));
    emailCont.text = prefs.getString("email");
    nameCont.text = prefs.getString("name");
  }
}
