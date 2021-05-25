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

class VowelsDetailScreen extends StatefulWidget
{
  VowelsDetailScreen({Key key, this.title,this.VowelsDetail}) : super(key: key);
  final String title;
  final Content VowelsDetail;
  @override
  _VowelsDetailScreenState createState() => _VowelsDetailScreenState();
}

class _VowelsDetailScreenState extends State<VowelsDetailScreen> {
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
              child:
              Stack(children: [
                Image.asset("assets/fatti_detail.png",fit: BoxFit.fill,height: SizeConfig.blockSizeVertical*100,),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*4.5,top: SizeConfig.blockSizeVertical*3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:()
                        {
                          Navigator.pop(context);
                        },
                        child: Container(alignment:Alignment.centerLeft,
                          margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*2.75),
                          child: Icon(Icons.arrow_back_sharp,size: SizeConfig.blockSizeVertical*4,color: Colors.white,),),
                      ),
                      Container(
                          margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*3.5,left: SizeConfig.blockSizeHorizontal*22),
                          child:
                          HtmlWidget(
                              widget.VowelsDetail.name,
                              textStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*15,
                                  fontWeight: FontWeight.w800,color: Colors.white,fontStyle: FontStyle.normal))
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*25),
                              child: /*Image.asset(widget.VowelsDetail.image,fit: BoxFit.fill,width: SizeConfig.blockSizeHorizontal*59.25,
                              height: SizeConfig.blockSizeVertical*30,*/
                              CachedNetworkImage(imageUrl: widget.VowelsDetail.image,fit: BoxFit.fill,width: SizeConfig.blockSizeHorizontal*59.25,
                                  height: SizeConfig.blockSizeVertical*32)
                          ),

                        ],
                      ),
                      Container(margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,
                          left: SizeConfig.blockSizeHorizontal*2,right: SizeConfig.blockSizeHorizontal*2),
                          alignment: Alignment.centerLeft,
                          child: HtmlWidget(
                              widget.VowelsDetail.description,
                              textStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*4,
                                  wordSpacing: SizeConfig.blockSizeVertical*1,
                                  fontWeight: FontWeight.w700,color: Colors.black))),
                    ],),
                ),
              ],))

      );
  }

}