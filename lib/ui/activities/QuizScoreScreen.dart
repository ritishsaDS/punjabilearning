import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/constant/Messages.dart';
import 'package:flutter_punjabilearning/data/repo/QuizRepo.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/models/MCQEntity.dart';
import 'package:flutter_punjabilearning/ui/activities/ResultScreen.dart';
import 'package:flutter_punjabilearning/ui/widgets/SwipeAnimation.dart';
import 'package:flutter_punjabilearning/utils/CommonUtils.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transformer_page_view/transformer_page_view.dart';



class QuizScreen extends StatefulWidget
{
  QuizScreen({Key key, }) : super(key: key);


  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
  var mcqrepo = new MCQRepo();
  var isloading = false;
  MCQEntity quizdata = new MCQEntity();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = true;
    mcqrepo.getquiz(context).then((value) {
      setState(() {
        isloading = false;
        if(value.code ==200)
          {
            quizdata = value;
          }
      });
    }).catchError((onError){
      setState(() {
        isloading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
      /*Container(  decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Word_detail.png"),
            fit: BoxFit.fill)),child:*/
      List<Widget> widgetList = new List<Widget>();
    var child = Stack(
        children: [
          Scaffold(
              appBar: new AppBar(backgroundColor:Colors.white,title: Text("Quiz",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.9,
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
                physics: NeverScrollableScrollPhysics(),
                itemCount:quizdata.data!=null?quizdata.data.data.length:0,
                itemBuilder: (BuildContext context, int index) {
                  return new  Container(
                      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1,horizontal: SizeConfig.blockSizeHorizontal*5),
                      child:Column(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.1),
                          width:SizeConfig.blockSizeHorizontal*85,
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Text("Question ${index+1} : ",style: new TextStyle(fontWeight: FontWeight.w700,fontSize:
                          SizeConfig.blockSizeVertical*2.5,color: logincolor ),),),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 0.5),
                            width: SizeConfig.blockSizeHorizontal * 85,
                            height: SizeConfig.blockSizeVertical * 27,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,color: logincolor,
                              border: Border.all(color: logincolor,width: 2.55),
                              borderRadius: BorderRadius.circular(12.0),
                              image: new DecorationImage(image: new CachedNetworkImageProvider(quizdata.data.data!=null?quizdata.data.data.elementAt(index).question:""))
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                              quizdata.data.data.elementAt(index).isselected1 = true;
                              quizdata.data.data.elementAt(index).isselected2 = false;
                              quizdata.data.data.elementAt(index).isselected3 = false;
                              quizdata.data.data.elementAt(index).isselected4 = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4.5),
                            width:SizeConfig.blockSizeHorizontal*85,
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,color:  quizdata.data.data.elementAt(index).isselected1?logincolor.withOpacity(0.8):Colors.white,
                                border: Border.all(color: logincolor,width: 2.0),
                                borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(quizdata.data.data.elementAt(index).option1,style: new TextStyle(fontWeight: FontWeight.w500,fontSize:
                            SizeConfig.blockSizeVertical*2.25,color:quizdata.data.data.elementAt(index).isselected1?Colors.white:Colors.black ),),),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                              quizdata.data.data.elementAt(index).isselected1 = false;
                              quizdata.data.data.elementAt(index).isselected2 = true;
                              quizdata.data.data.elementAt(index).isselected3 = false;
                              quizdata.data.data.elementAt(index).isselected4 = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                            width:SizeConfig.blockSizeHorizontal*85,
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,color:  quizdata.data.data.elementAt(index).isselected2?logincolor.withOpacity(0.8):Colors.white,
                              border: Border.all(color: logincolor,width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(quizdata.data.data.elementAt(index).option2,style: new TextStyle(fontWeight: FontWeight.w500,fontSize:
                            SizeConfig.blockSizeVertical*2.25,color:quizdata.data.data.elementAt(index).isselected2?Colors.white:Colors.black ),),),
                        ),
                        InkWell(
                          onTap:()
                          {
                            setState(() {
                              quizdata.data.data.elementAt(index).isselected1 = false;
                              quizdata.data.data.elementAt(index).isselected2 = false;
                              quizdata.data.data.elementAt(index).isselected3 = true;
                              quizdata.data.data.elementAt(index).isselected4 = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                            width:SizeConfig.blockSizeHorizontal*85,
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,color:  quizdata.data.data.elementAt(index).isselected3?logincolor.withOpacity(0.8):Colors.white,
                              border: Border.all(color: logincolor,width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(quizdata.data.data.elementAt(index).option3,style: new TextStyle(fontWeight: FontWeight.w500,fontSize:
                            SizeConfig.blockSizeVertical*2.25,color:quizdata.data.data.elementAt(index).isselected3?Colors.white:Colors.black ),),),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                              quizdata.data.data.elementAt(index).isselected1 = false;
                              quizdata.data.data.elementAt(index).isselected2 = false;
                              quizdata.data.data.elementAt(index).isselected3 = false;
                              quizdata.data.data.elementAt(index).isselected4 = true;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                            width:SizeConfig.blockSizeHorizontal*85,
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,color:  quizdata.data.data.elementAt(index).isselected4?logincolor.withOpacity(0.8):Colors.white,
                              border: Border.all(color: logincolor,width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(quizdata.data.data.elementAt(index).option4,style: new TextStyle(fontWeight: FontWeight.w500,fontSize:
                            SizeConfig.blockSizeVertical*2.25,color: quizdata.data.data.elementAt(index).isselected4?Colors.white:Colors.black ),),),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            if(index+1!=quizdata.data.data.length)
                              {
                                var isoptionselected = false;
                                if(quizdata.data.data.elementAt(index).isselected1)
                                  {
                                    isoptionselected = true;
                                  }
                                else if(quizdata.data.data.elementAt(index).isselected2)
                                {
                                  isoptionselected = true;
                                }
                                else if(quizdata.data.data.elementAt(index).isselected3)
                                {
                                  isoptionselected = true;
                                }
                                else if(quizdata.data.data.elementAt(index).isselected4)
                                {
                                  isoptionselected = true;
                                }
                                if(isoptionselected)
                                  {
                                    _controller.move(index+1);
                                  }
                                else
                                  {
                                    Fluttertoast.showToast(msg: "Please Enter One Option");
                                  }

                              }
                            else
                              {
                                var isoptionselected = false;
                                if(quizdata.data.data.elementAt(index).isselected1)
                                {
                                  isoptionselected = true;
                                }
                                else if(quizdata.data.data.elementAt(index).isselected2)
                                {
                                  isoptionselected = true;
                                }
                                else if(quizdata.data.data.elementAt(index).isselected3)
                                {
                                  isoptionselected = true;
                                }
                                else if(quizdata.data.data.elementAt(index).isselected4)
                                {
                                  isoptionselected = true;
                                }
                                if(isoptionselected)
                                {
                                   var correctanswer = 0;
                                   for(int i=0;i<quizdata.data.data.length;i++)
                                     {
                                       if(quizdata.data.data.elementAt(i).isselected1)
                                         {
                                           if(quizdata.data.data.elementAt(i).option1 == quizdata.data.data.elementAt(i).correctAnswer)
                                             {
                                               correctanswer = correctanswer+1;
                                             }
                                         }
                                       else if(quizdata.data.data.elementAt(i).isselected2)
                                       {
                                         if(quizdata.data.data.elementAt(i).option2 == quizdata.data.data.elementAt(i).correctAnswer)
                                         {
                                           correctanswer = correctanswer+1;
                                         }
                                       }
                                      else if(quizdata.data.data.elementAt(i).isselected3)
                                       {
                                         if(quizdata.data.data.elementAt(i).option3 == quizdata.data.data.elementAt(i).correctAnswer)
                                         {
                                           correctanswer = correctanswer+1;
                                         }
                                       }
                                      else if(quizdata.data.data.elementAt(i).isselected4)
                                       {
                                         if(quizdata.data.data.elementAt(i).option4 == quizdata.data.data.elementAt(i).correctAnswer)
                                         {
                                           correctanswer = correctanswer+1;
                                         }
                                       }
                                     }
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context) => ResultScreen(numberOfCorrectAnswers: correctanswer, numberOfQuestions: quizdata.data.data.length)));
                                }
                                else
                                {
                                  Fluttertoast.showToast(msg: "Please Enter One Option");
                                }
                              }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*8),
                            width:SizeConfig.blockSizeHorizontal*85,
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,color: logincolor,
                              border: Border.all(color: logincolor,width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(index+1==quizdata.data.data.length?"SUBMIT":"NEXT",style: new TextStyle(fontWeight: FontWeight.w500,fontSize:
                            SizeConfig.blockSizeVertical*2.25,color:Colors.white ),),),
                        )
                      ],));
                },
              )
          ),

        ],
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
  void onPageChanged(index) {
    // Index of current tab is focused
    print(index);
    setState(() {
      selectedindex =index;
    });

  }

}
