import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';


class ResultScreen extends StatelessWidget {
  final int numberOfQuestions;
  final int numberOfCorrectAnswers;

  ResultScreen({@required this.numberOfCorrectAnswers, @required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6),
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  margin: EdgeInsets.all(20),
                  color: logincolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 15,
                  child: Container(
                    padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical*12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*12),
                          child: Icon(Icons.thumb_up,size: SizeConfig.blockSizeVertical*15,color: Colors.white,),),
                        Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*4),
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*6),
                          child: Text(
                            'Congratulations!',
                            style: TextStyle(fontSize: SizeConfig.blockSizeVertical*4.5, fontWeight: FontWeight.w900,color: Colors.white),
                          ),
                        ),
                        Text(
                          'Your Score: $numberOfCorrectAnswers / $numberOfQuestions',
                          style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3.25,color: Colors.white,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: ()
                    {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*8),
                      width:SizeConfig.blockSizeHorizontal*50,
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*1.5),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,color: logincolor,
                        border: Border.all(color: logincolor,width: 2.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text("OK",style: new TextStyle(fontWeight: FontWeight.w500,fontSize:
                      SizeConfig.blockSizeVertical*2.25,color:Colors.white ),),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}