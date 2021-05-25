import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../wordsignature.dart';
import 'SignaturePad.dart';

class WordDetailScreen extends StatefulWidget {
  WordDetailScreen(
      {Key key,
      this.title,
      this.name,
      this.image,
      this.audio,
      this.description})
      : super(key: key);
  final String title;
  final String image;
  final String audio;
  final String name;
  final String description;
  @override
  _WordDetailScreenState createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  AudioPlayer advancedPlayer = AudioPlayer();

  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return /*Container(  decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Word_detail.png"),
            fit: BoxFit.fill)),child:*/
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                child: Stack(
              children: [
                Image.asset(
                  "assets/fatti_detail.png",
                  fit: BoxFit.fill,
                  height: SizeConfig.blockSizeVertical * 100,
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
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3.5,
                              left: SizeConfig.blockSizeHorizontal * 22),
                          child: HtmlWidget(widget.name,
                              textStyle: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 10,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal))),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              print(widget.audio);
                              advancedPlayer.play(widget.audio);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(
                                  SizeConfig.blockSizeHorizontal * 1),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 5),
                              child: Icon(
                                Icons.volume_up,
                                size: SizeConfig.blockSizeVertical * 5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          WordSignature(
                                            name: widget.name,
                                          )));
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 5,
                                  left: SizeConfig.blockSizeHorizontal * 6),
                              child: Icon(
                                Icons.brush_sharp,
                                size: SizeConfig.blockSizeVertical * 5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 7),
                              child:
                                  /*Image.asset(widget.fattidetail.image,fit: BoxFit.fill,width: SizeConfig.blockSizeHorizontal*59.25,
                              height: SizeConfig.blockSizeVertical*30,*/
                                  CachedNetworkImage(
                                      imageUrl: widget.image,
                                      fit: BoxFit.fill,
                                      width: SizeConfig.blockSizeHorizontal *
                                          59.25,
                                      height:
                                          SizeConfig.blockSizeVertical * 32)),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1,
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2),
                          alignment: Alignment.centerLeft,
                          child: HtmlWidget(widget.description,
                              textStyle: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 5,
                                  wordSpacing: SizeConfig.blockSizeVertical * 1,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black))),
                    ],
                  ),
                ),
              ],
            )));
  }
}
