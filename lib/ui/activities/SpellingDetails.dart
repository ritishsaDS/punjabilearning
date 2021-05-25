import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/constant/Messages.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/ui/widgets/SwipeAnimation.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:transformer_page_view/transformer_page_view.dart';



class SpellingDetailScreen extends StatefulWidget
{
  SpellingDetailScreen({Key key, this.title,this.fattidetail}) : super(key: key);
  final String title;
  final List<Content> fattidetail;

  @override
  _SpellingDetailScreenState createState() => _SpellingDetailScreenState();
}

class _SpellingDetailScreenState extends State<SpellingDetailScreen> {
  final TextEditingController emailCont = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;
  var passCont = TextEditingController();
  bool isRegisterd = false;
  int selectedindex=0;
  final GlobalKey<State> loginloader = new GlobalKey<State>();
  var passFocus = FocusNode();
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  IndexController _controller = IndexController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  /*Container(  decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Word_detail.png"),
            fit: BoxFit.fill)),child:*/
      Stack(
        children: [
          Scaffold(
              appBar: new AppBar(backgroundColor:Colors.white,title: Text(widget.title,style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.9,
                  fontWeight: FontWeight.w700,color: logincolor),),
                centerTitle: true,automaticallyImplyLeading: false,elevation: 1.0,
                leading: InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: new Container(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*0.5,horizontal: SizeConfig.blockSizeHorizontal*1.25),
                    child:Icon(Icons.arrow_back_sharp,size: SizeConfig.blockSizeVertical*4,color: logincolor,) ,),
                ),
              ),
              resizeToAvoidBottomInset: false,
              body: TransformerPageView(
                viewportFraction: 0.8,
                loop: false,
                scrollDirection: Axis.horizontal,
                index: 0,
                controller: _controller,
                onPageChanged: this.onPageChanged,
                itemCount: widget.fattidetail.length,
                transformer: ScaleAndFadeTransformer(),
                itemBuilder: (BuildContext context, int index) {
                  return new  Container(
                    margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*3,horizontal: SizeConfig.blockSizeHorizontal*10),
                      child:
                      Stack(children: [
                        Image.asset("assets/fatti_detail.png",fit: BoxFit.fill,height: SizeConfig.blockSizeVertical*100,),
                        Container(
                          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*4.5,top: SizeConfig.blockSizeVertical*3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*0.1),
                                  child: CachedNetworkImage(imageUrl:widget.fattidetail.elementAt(index).image,fit: BoxFit.fill,width: SizeConfig.blockSizeHorizontal*56,
                                    height: SizeConfig.blockSizeVertical*24,)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap:()
                          {
                            advancedPlayer.play(widget.fattidetail.elementAt(index).audio);
                          },
                                    child: Container(alignment:Alignment.centerLeft,
                                      margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*5),
                                      child: Icon(Icons.volume_up,size: SizeConfig.blockSizeVertical*5,color: Colors.white,),),
                                  ),
                                ],
                              ),
                              Container(margin:EdgeInsets.only(top: SizeConfig.blockSizeVertical*12,
                                  left: SizeConfig.blockSizeHorizontal*4,right: SizeConfig.blockSizeHorizontal*2),
                                  alignment: Alignment.centerLeft,
                                  child: HtmlWidget(
                                      widget.fattidetail.elementAt(index).description,
                                      textStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*4.5 ,
                                          fontWeight: FontWeight.w700,color: Colors.black))),
                            ],),
                        ),
                      ],));
                },
              )
          ),

          Positioned(
              top:SizeConfig.screenHeight-SizeConfig.blockSizeVertical*60,
              left:SizeConfig.screenWidth-SizeConfig.blockSizeVertical*4.1,
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if(selectedindex< widget.fattidetail.length-1) {
                        print(selectedindex);
                        print( widget.fattidetail.length);
                        selectedindex = selectedindex + 1;
                        _controller.move(selectedindex);
                      }
                    });
                  },
                  child:Container(
                    child: Icon(Icons.arrow_forward_ios,color: selectedindex< widget.fattidetail.length-1?logincolor:Colors.black38,size: SizeConfig.blockSizeHorizontal*8.5,),
                  )
              )),
          Positioned(
              top:SizeConfig.screenHeight-SizeConfig.blockSizeVertical*60,
              right:SizeConfig.screenWidth-SizeConfig.blockSizeVertical*5.25,
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if(selectedindex!=0) {
                        print(selectedindex);
                        print( widget.fattidetail.length);
                        selectedindex = selectedindex - 1;
                        _controller.move(selectedindex);
                      }
                    });
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                    child: Icon(Icons.arrow_back_ios,color: selectedindex==0?Colors.black38:logincolor,size: SizeConfig.blockSizeHorizontal*8.5,),
                  )
              ))
        ],
      );
  }
  void onPageChanged(index) {
    // Index of current tab is focused
    print(index);
    setState(() {
      selectedindex =index;
    });

  }

}
