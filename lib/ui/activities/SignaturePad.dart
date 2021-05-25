import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/constant/Messages.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:signature/signature.dart';

class SignatureDetailScreen extends StatefulWidget
{
  SignatureDetailScreen({Key key, this.title,this.Signaturedetail}) : super(key: key);
  final String title;
  final Content Signaturedetail;
  @override
  _SignatureDetailScreenState createState() => _SignatureDetailScreenState();
}

class _SignatureDetailScreenState extends State<SignatureDetailScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  SignatureController controller = SignatureController(
      penStrokeWidth: 5,
      penColor: logincolor,
      exportBackgroundColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  /*Container(  decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/fatti_detail.png"),
            fit: BoxFit.fill)),child:*/
      Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Stack(
                        children: [
                          Image.asset("assets/homelogo.png",fit: BoxFit.fill,height: SizeConfig.blockSizeVertical*28,
                            width: SizeConfig.blockSizeHorizontal*50,),
                          InkWell(
                            onTap:()
                            {
                              Navigator.pop(context);
                            },
                            child: Container(alignment:Alignment.centerLeft,
                              margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*5.5,left: SizeConfig.blockSizeHorizontal*5),
                              child: Icon(Icons.arrow_back_sharp,size: SizeConfig.blockSizeVertical*4.25,color: Colors.white,),),
                          ),
                        ],
                      ),
                      Container(

                          margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*9.5,left: SizeConfig.blockSizeHorizontal*5),
                          child:
                          HtmlWidget(
                              widget.Signaturedetail.name,
                              textStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*14,
                                  fontWeight: FontWeight.w800,color: logincolor,fontStyle: FontStyle.normal))
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(width: 2.75,color: logincolor),
                        ),
                        height: SizeConfig.blockSizeVertical*62,
                        width: SizeConfig.blockSizeHorizontal*100,
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*5,
                        left: SizeConfig.blockSizeHorizontal*5,right: SizeConfig.blockSizeHorizontal*5
                        ),
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*9),
                        child: Signature(
                          controller: controller,
                          height: SizeConfig.blockSizeVertical*62,
                          backgroundColor: Colors.transparent,
                        ),),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6.25,
                                left: SizeConfig.blockSizeHorizontal*6,right: SizeConfig.blockSizeHorizontal*6
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Icon(
                                    Icons.delete,
                                    color: logincolor,size: SizeConfig.blockSizeVertical*5,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      controller.clear();
                                    });
                                  },
                                )
                              ],
                            ),
                          ))
                    ],
                  )
                ],)),

      );
  }

}
