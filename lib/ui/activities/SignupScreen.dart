import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/constant/Messages.dart';
import 'package:flutter_punjabilearning/data/repo/RegisterUser.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/Dialogs.dart';
import 'package:flutter_punjabilearning/utils/SharedPref.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget
{
  RegisterScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameCont = new TextEditingController();
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool cobscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  var confirmCont = TextEditingController();
  bool isRegisterd = false;
  final GlobalKey<State> registerloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  var emailFocus = FocusNode();
  var registerrepo = RegisterUserRepo();
  var confmFocus = FocusNode();
  var applogo = "";
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
      body: Container( color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*3),
              child: Container(
                child:Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            InkWell(
                              onTap: ()
                              {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6),
                                  child:Icon(Icons.arrow_back,color: logincolor,size: SizeConfig.blockSizeVertical*3.5,)
                              ),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6),
                              child: Text(
                                'REGISTER USER',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.25,fontWeight: FontWeight.bold,color: logincolor),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4),
                            width: SizeConfig.blockSizeHorizontal*40,
                            height:SizeConfig.blockSizeHorizontal*40,
                            decoration: new BoxDecoration(
                              color: logincolor,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                                radius: SizeConfig.blockSizeHorizontal * 17,
                                backgroundColor: logincolor,
                                backgroundImage:
                                CachedNetworkImageProvider(applogo!=null?applogo:"")),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: Text(
                            'Name',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.05,fontWeight: FontWeight.w500,color: logincolor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.7,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: TextFormField(
                            controller: nameCont,
                            cursorColor:logincolor,
                            style: TextStyle(fontSize: 16.0 ),showCursor: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(),hintText: "Name",hintStyle: TextStyle(fontWeight: FontWeight.w500,color:translogincolor ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: logincolor,width: 1.5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                  BorderSide(color: logincolor,width: 1.25)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (s)
                            {
                              if (s.trim().isEmpty) return "Name is required";
                              return null;
                            },
                            onFieldSubmitted: (s) =>
                                FocusScope.of(context).requestFocus(emailFocus),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: Text(
                            'Email',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.05,fontWeight: FontWeight.w500,color: logincolor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.7,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: TextFormField(
                            controller: emailCont,
                            focusNode: emailFocus,
                            cursorColor:logincolor,
                            style: TextStyle(fontSize: 16.0 ),showCursor: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(),hintText: "Email",hintStyle: TextStyle(fontWeight: FontWeight.w500,color:translogincolor ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: logincolor,width: 1.5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                  BorderSide(color: logincolor,width: 1.25)),
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
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: Text(
                            'Password',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,fontWeight: FontWeight.w600,color: logincolor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.7,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: TextFormField(
                            obscureText: obscureText,
                            focusNode: passFocus,
                            cursorColor:logincolor,
                            controller: passCont,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: logincolor,width: 1.5)),
                                hintText: "Password",hintStyle: TextStyle(fontWeight: FontWeight.w500,color:translogincolor ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                    BorderSide(color: logincolor,width: 1.25)),
                                suffix: InkWell(
                                  onTap:(() {
                                    obscureText = !obscureText;
                                    setState(() {});
                                  }),
                                  child: Icon(!obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                )

                            ),
                            validator: (s) {
                              if (s.trim().isEmpty) return "Password is Required";
                              return null;
                            },
                            onFieldSubmitted: (s) =>
                                FocusScope.of(context).requestFocus(confmFocus),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: Text(
                            'Confirm Password',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.15,fontWeight: FontWeight.w600,color: logincolor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.7,left: SizeConfig.blockSizeVertical*1,right: SizeConfig.blockSizeHorizontal*1),
                          child: TextFormField(
                            obscureText: cobscureText,
                            focusNode: confmFocus,
                            cursorColor:logincolor,
                            controller: confirmCont,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: logincolor,width: 1.5)),
                                hintText: "Confirm Password",hintStyle: TextStyle(fontWeight: FontWeight.w500,color:translogincolor ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                    BorderSide(color: logincolor,width: 1.25)),
                                suffix: InkWell(
                                  onTap:(() {
                                    cobscureText = !cobscureText;
                                    setState(() {

                                    });
                                  }),
                                  child: Icon(!cobscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                )

                            ),
                            onFieldSubmitted: (s) =>
                                FocusScope.of(context).unfocus(),
                            validator: (s) {
                              if (s.trim().isEmpty) return "Confirm Password is Required";
                              return null;
                            },
                          ),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            if (formKey.currentState.validate())
                            {
                              formKey.currentState.save();
                              Dialogs.showLoadingDialog(context, registerloader);
                              registerrepo
                                  .registeruser(
                                emailCont.text.trim().toString().toLowerCase(),
                                password:passCont.text.trim().toString(),
                                context:context,
                                name: nameCont.text.trim().toString(),
                                cpassword: confirmCont.text.trim().toString()
                              )
                                  .then((value) {
                                if (value != null) {
                                  Navigator.of(registerloader.currentContext,
                                      rootNavigator: true)
                                      .pop();
                                  if (value.success) {
                                    Fluttertoast.showToast(
                                        msg: "User Registered Successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                    Navigator.pop(context);
                                  }
                                  else {
                                    Fluttertoast.showToast(
                                        msg: "Something went wrong",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                } else {
                                  Navigator.of(registerloader.currentContext,
                                      rootNavigator: true)
                                      .pop();
                                }
                              }).catchError((error) {
                                Navigator.of(registerloader.currentContext,
                                    rootNavigator: true)
                                    .pop();
                                Fluttertoast.showToast(
                                    msg: "Something went wrong",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              });
                            } else {
                              autoValidate = true;
                            }
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal*100,margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*7,left: SizeConfig.blockSizeHorizontal*1,right: SizeConfig.blockSizeHorizontal*1),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.3,),
                              decoration: BoxDecoration(
                                  color: logincolor,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: defaultBoxShadow()),
                              child: Text('SIGNUP',
                                style:TextStyle(fontSize: SizeConfig.blockSizeVertical*2.2,fontWeight: FontWeight.w700,color: Colors.white),),
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  bool validateEmail(String email) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
