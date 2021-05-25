import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/constant/Messages.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
class StoriesDetailScreen extends StatefulWidget
{
  StoriesDetailScreen({Key key, this.title,this.storydetail}) : super(key: key);
  final String title;
  final Content storydetail;
  @override
  _StoriesDetailScreenState createState() => _StoriesDetailScreenState();
}

class _StoriesDetailScreenState extends State<StoriesDetailScreen> {
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
        appBar: new AppBar(backgroundColor:logincolor,title:Container(
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*14),
          child: HtmlWidget(
              widget.storydetail.name,
              textStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.9,
                  fontWeight: FontWeight.w600,color: Colors.white)),
        ),centerTitle: true,
        actions: [
          InkWell(
            onTap: ()
            {
              advancedPlayer.play(widget.storydetail.audio);
            },
            child: Container(alignment:Alignment.centerLeft,padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal*1),
              margin:EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
              child: Icon(Icons.volume_up,size: SizeConfig.blockSizeVertical*4,color: Colors.white,),),
          ),
        ],
        ),
          resizeToAvoidBottomInset: false,
          body: Container(
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*5,right: SizeConfig.blockSizeHorizontal*5,
                  top: SizeConfig.blockSizeVertical*3,bottom: SizeConfig.blockSizeVertical*1),
              child:
              Column(children: [
              Container(
                width: SizeConfig.blockSizeHorizontal*100,
                height: SizeConfig.blockSizeVertical*28,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0,color: logincolor),
              borderRadius: BorderRadius.only(topRight: Radius.circular(6.0),topLeft: Radius.circular(6.0),
              bottomLeft: Radius.circular(6.0),bottomRight: Radius.circular(6.0)
                 )),
                child:  CachedNetworkImage(imageUrl: widget.storydetail.image),),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
                  height: SizeConfig.blockSizeVertical*54.5,
                  child: SingleChildScrollView(child:
                      Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                        child: HtmlWidget(
                            widget.storydetail.khani,
                            textStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.4,
                                fontWeight: FontWeight.w600,color: Colors.black)),
                      ),)
                )
              ],))

      );
  }

}
