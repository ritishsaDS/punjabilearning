import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';

class ForgetScreen extends StatefulWidget {
  ForgetScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 3),
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 7),
                              child: Icon(
                                Icons.arrow_back,
                                color: logincolor,
                                size: SizeConfig.blockSizeVertical * 3.5,
                              )),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 7),
                          child: Text(
                            'FORGET PASSWORD',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold,
                                color: logincolor),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 8),
                        width: SizeConfig.blockSizeHorizontal * 45,
                        height: SizeConfig.blockSizeHorizontal * 45,
                        decoration: new BoxDecoration(
                          color: logincolor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 10,
                          left: SizeConfig.blockSizeVertical * 1,
                          right: SizeConfig.blockSizeHorizontal * 1),
                      child: Text(
                        'EMAIL',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 2.05,
                            fontWeight: FontWeight.w500,
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
                          if (s.trim().isEmpty) return "Email is requires";
                          if (validateEmail(s)) return 'Email is invalid';
                          return null;
                        },
                        onFieldSubmitted: (s) =>
                            FocusScope.of(context).requestFocus(passFocus),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    InkWell(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 40,
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
                            'SEND EMAIL',
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 2.5),
                      child: Text(
                        'Already Have Account?Login',
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
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool validateEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
