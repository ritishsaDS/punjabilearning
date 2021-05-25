import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/data/repo/LoginUser.dart';
import 'package:flutter_punjabilearning/data/repo/RegisterUser.dart';
import 'package:flutter_punjabilearning/ui/activities/DashBoardScreen.dart';
import 'package:flutter_punjabilearning/ui/activities/ForgotPassword%20Screen.dart';
import 'package:flutter_punjabilearning/ui/activities/SignupScreen.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/Dialogs.dart';
import 'package:flutter_punjabilearning/utils/SharedPref.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_punjabilearning/utils/SocialLoginMethods.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  var loginrepo = LoginUserRepo();
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var applogo = "";
  var registerUserRepo = RegisterUserRepo();
  final GlobalKey<State> registerloader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesTest().applogo("1", "value").then((value) {
      setState(() {
        applogo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 5),
                      width: SizeConfig.blockSizeHorizontal * 40,
                      height: SizeConfig.blockSizeHorizontal * 40,
                      decoration: new BoxDecoration(
                        color: logincolor,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                          radius: SizeConfig.blockSizeHorizontal * 15,
                          backgroundColor: logincolor,
                          backgroundImage: CachedNetworkImageProvider(
                              applogo != null ? applogo : "")),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 16),
                    child: Text(
                      'USERNAME',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.15,
                          fontWeight: FontWeight.w600,
                          color: logincolor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 0.7),
                    child: TextFormField(
                      controller: emailCont,
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
                        top: SizeConfig.blockSizeVertical * 3.5),
                    child: Text(
                      'PASSWORD',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.15,
                          fontWeight: FontWeight.w600,
                          color: logincolor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 0.7),
                    child: TextFormField(
                      obscureText: obscureText,
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
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: translogincolor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(color: logincolor, width: 1.25)),
                          suffix: InkWell(
                            onTap: (() {
                              obscureText = !obscureText;
                              setState(() {});
                            }),
                            child: Icon(!obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      validator: (s) {
                        if (s.trim().isEmpty) return "Password is required";
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ForgetScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.5),
                        child: Text(
                          'FORGET PASSWORD?',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.85,
                              fontWeight: FontWeight.w600,
                              color: logincolor),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        Dialogs.showLoadingDialog(context, loginloader);
                        loginrepo
                            .loginuser(
                          emailCont.text.trim().toString().toLowerCase(),
                          passCont.text.trim().toString(),
                          context,
                          "0",
                        )
                            .then((value) async {
                          if (value != null) {
                            Navigator.of(loginloader.currentContext,
                                    rootNavigator: true)
                                .pop();
                            if (value.success) {
                              SharedPreferencesTest().checkIsLogin("0");
                              SharedPreferencesTest()
                                  .accesstoken("0", value.token);
                              SharedPreferencesTest().saveRegisteredValue(true);
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString(
                                "email",
                                emailCont.text.trim().toString().toLowerCase(),
                              );
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeScreen()));
                            } else {
                              Fluttertoast.showToast(
                                  msg: value.message,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } else {
                            Navigator.of(loginloader.currentContext,
                                    rootNavigator: true)
                                .pop();
                          }
                        }).catchError((error) {
                          Navigator.of(loginloader.currentContext,
                                  rootNavigator: true)
                              .pop();
                        });
                      } else {
                        autoValidate = true;
                      }
                      setState(() {});
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 30,
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 4.75),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 1.3,
                        ),
                        decoration: BoxDecoration(
                            color: logincolor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: defaultBoxShadow()),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.4,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SignInButton(Buttons.Google,
                        onPressed: () => loginWithGoogle()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SignInButton(Buttons.FacebookNew,
                        onPressed: () => loginWithFb()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 5),
                          child: Text(
                            'Dont Have an Account?',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 2.15,
                                fontWeight: FontWeight.w600,
                                color: translogincolor),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 5),
                            child: Text(
                              'SignUp!',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 2.15,
                                  fontWeight: FontWeight.bold,
                                  color: logincolor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  loginWithGoogle() async {
    String password = '12345678';

    SocialLogin().googleLogin().then((value) async {
      String email = value.googleProfile.email;
      String name = value.googleProfile.displayName;
      if (value != null &&
          value != "" &&
          value.googleProfile.email != null &&
          value.googleProfile.email != "") {
        //  SharedPreferenceData().saveGoogleDetails(data: value.googleProfile);
        Dialogs.showLoadingDialog(context, loginloader);
        registerUserRepo
            .registeruser(value.googleProfile.email,
                name: value.googleProfile.displayName,
                password: password,
                cpassword: password)
            .then((registerValue) {
          if (registerValue.success) {
            Dialogs.showLoadingDialog(context, loginloader);
            loginrepo
                .loginuser(
              value.googleProfile.email,
              password,
              context,
              "0",
            )
                .then((value) async {
              if (value != null) {
                Navigator.of(loginloader.currentContext, rootNavigator: true)
                    .pop();
                if (value.success) {
                  SharedPreferencesTest().checkIsLogin("0");
                  SharedPreferencesTest().accesstoken("0", value.token);
                  SharedPreferencesTest().saveRegisteredValue(true);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("email", email);
                  prefs.setString("name", name);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen()));
                } else {
                  Fluttertoast.showToast(
                      msg: value.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              } else {
                Navigator.of(loginloader.currentContext, rootNavigator: true)
                    .pop();
              }
            });
          } else {
            Fluttertoast.showToast(
                msg: registerValue.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        });
      }
    });
  }

  loginWithFb() async {
    String password = '12345678';
    SocialLogin().fbLogin(context: context).then((value) async {
      // Dialogs.showLoadingDialog(context, loginloader);
      if (value != null &&
          value != "" &&
          value.profile['email'] != null &&
          value.profile['email'] != "") {
        Dialogs.showLoadingDialog(context, loginloader);
        registerUserRepo
            .registeruser(value.profile['email'],
                name: value.profile['first_name'],
                password: password,
                cpassword: password)
            .then((registerValue) {
          if (registerValue.success) {
            loginrepo
                .loginuser(
              value.profile['email'],
              "12345678",
              context,
              "0",
            )
                .then((value) {
              if (value != null) {
                Navigator.of(loginloader.currentContext, rootNavigator: true)
                    .pop();
                if (value.success) {
                  SharedPreferencesTest().checkIsLogin("0");
                  SharedPreferencesTest().accesstoken("0", value.token);
                  SharedPreferencesTest().saveRegisteredValue(true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen()));
                } else {
                  Fluttertoast.showToast(
                      msg: value.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              } else {
                Navigator.of(loginloader.currentContext, rootNavigator: true)
                    .pop();
              }
            });
          } else {
            Navigator.of(loginloader.currentContext, rootNavigator: true).pop();
            Fluttertoast.showToast(
                msg: registerValue.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        });
      }
    });
  }

  // temp method to try google login
  // googleLoginNewTry() {
  //   return SocialLogin().googleSignin().then((google) => {
  //         if (google != null)
  //           {
  //             registerUserRepo
  //                 .registeruser(google.user.email,
  //                     password: password,
  //                     context: context,
  //                     name: google.user.displayName,
  //                     cpassword: password)
  //                 .then((registerValue) {
  //               if (registerValue.success) {
  //                 loginrepo
  //                     .loginuser(
  //                   google.user.email,
  //                   password,
  //                   context,
  //                   "0",
  //                 )
  //                     .then((loginValue) {
  //                   if (loginValue != null) {
  //                     Navigator.of(loginloader.currentContext,
  //                             rootNavigator: true)
  //                         .pop();
  //                     if (loginValue.success) {
  //                       SharedPreferencesTest().checkIsLogin("0");
  //                       SharedPreferencesTest()
  //                           .accesstoken("0", loginValue.token);
  //                       SharedPreferencesTest().saveRegisteredValue(true);
  //                       Navigator.pushReplacement(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (BuildContext context) =>
  //                                   HomeScreen()));
  //                     } else {
  //                       Fluttertoast.showToast(
  //                           msg: loginValue.message,
  //                           toastLength: Toast.LENGTH_SHORT,
  //                           gravity: ToastGravity.BOTTOM,
  //                           timeInSecForIosWeb: 1,
  //                           backgroundColor: Colors.black,
  //                           textColor: Colors.white,
  //                           fontSize: 16.0);
  //                     }
  //                   } else {
  //                     Navigator.of(loginloader.currentContext,
  //                             rootNavigator: true)
  //                         .pop();
  //                   }
  //                 }).catchError((error) {
  //                   Navigator.of(loginloader.currentContext,
  //                           rootNavigator: true)
  //                       .pop();
  //                 });
  //               }
  //             }).catchError((error) {
  //               Navigator.of(registerloader.currentContext, rootNavigator: true)
  //                   .pop();
  //               Fluttertoast.showToast(
  //                   msg: "Something went wrong",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   gravity: ToastGravity.BOTTOM,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.black,
  //                   textColor: Colors.white,
  //                   fontSize: 16.0);
  //             })
  //           }
  //       });
  // }

  bool validateEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
