import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/models/Fatti.dart';
import 'package:flutter_punjabilearning/ui/activities/WordDetail.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class WordScreen extends StatefulWidget {
  WordScreen({Key key, this.title, this.detail, this.index}) : super(key: key);
  final String title;
  final dynamic index;
  final List<Content> detail;
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen>
{
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
    return Container(
      height: SizeConfig.blockSizeVertical * 100,
      width: SizeConfig.blockSizeHorizontal * 100,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 2.9,
                fontWeight: FontWeight.w700,
                color: logincolor),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 1.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: new Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 0.5,
                  horizontal: SizeConfig.blockSizeHorizontal * 1.25),
              child: Icon(
                Icons.arrow_back_sharp,
                size: SizeConfig.blockSizeVertical * 4,
                color: logincolor,
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                height: SizeConfig.blockSizeVertical*80,
                width: SizeConfig.blockSizeHorizontal*100,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*6.5),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:SizeConfig.blockSizeHorizontal*4.2,
                        mainAxisSpacing: SizeConfig.blockSizeVertical*2,
                        childAspectRatio: 1.15
                    ),
                    itemCount: widget.detail.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: ()
                        {
                          // if(widget.index!=0) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (BuildContext context) =>
                          //               WordDetailScreen(
                          //                 voweldetail: widget.detail.elementAt(
                          //                     index),)));
                          // }
                        },
                        child: Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
              height: SizeConfig.blockSizeVertical * 80,
              width: SizeConfig.blockSizeHorizontal * 100,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 6.5),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: SizeConfig.blockSizeHorizontal * 4.2,
                      mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
                      childAspectRatio: 1.15),
                  itemCount: widget.detail.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (widget.index != 0) {
                          
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             WordDetailScreen(

                          //               voweldetail:
                          //                   widget.detail.elementAt(index),
                          //             )));
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(width: 2.5, color: logincolor),
                              color: logincolor),
                          height: SizeConfig.blockSizeVertical * 6,
                          width: SizeConfig.blockSizeHorizontal * 20,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(width: 1.0, color: Colors.white),
                                color: Colors.white),
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 8,
                                top: SizeConfig.blockSizeVertical * 0.4),
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 0.2,
                                right: SizeConfig.blockSizeHorizontal * 0.2,
                                top: SizeConfig.blockSizeVertical * 0.75,
                                bottom: SizeConfig.blockSizeVertical * 0.2),
                            child: HtmlWidget(
                                widget.detail.elementAt(index).name,
                                textStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 4.75,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          )),
                    );
                  }),
            )
          ],
        )),
      );}))]))));// This trailing comma makes auto-formatting nicer for build methods.
  }
}
