import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/ui/activities/VowelsDetail.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;

import 'WordDetail.dart';

class Wordnew extends StatefulWidget {
  dynamic title;
  Wordnew({this.title});
  @override
  _WordnewState createState() => _WordnewState();
}

class _WordnewState extends State<Wordnew> {
  bool isloading = false;

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    // TODO: implement build
     var child = Container(
      height: SizeConfig.blockSizeVertical * 100,
      width: SizeConfig.blockSizeHorizontal * 100,
      child:  Scaffold(
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 3,
            children: getSunject(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    ));
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

  List<Widget> getSunject() {
    List<Widget> productLists = new List();
    List categories = requestfromserver;
    for (int i = 0; i < categories.length; i++) {
      print("sdujh" + categories[i]['id'].toString());
      productLists.add(
        GestureDetector(
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
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeVertical * 0.4),
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 0.2,
                    right: SizeConfig.blockSizeHorizontal * 0.2,
                    top: SizeConfig.blockSizeVertical * 0.75,
                    bottom: SizeConfig.blockSizeVertical * 0.2),
                child: HtmlWidget(categories[i]['name'],
                    textStyle: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 4,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
              )),
          onTap: () {
            print(categories[i]);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => WordDetailScreen(
                        name: categories[i]['name'],
                        image: categories[i]['image'],
                        description: categories[i]['description'],
                        audio: categories[i]['audio'])));
          },
        ),
      );
    }
    return productLists;
  }

  dynamic requestfromserver = new List();

  Future<void> getdata() async {
    isloading = true;
    try {
      final response =
          await http.post("http://3.13.67.137/api/manage-content", body: {
        "type": "Lipi",
      });
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        // print(responseJson.toString() + "hello");
        
        requestfromserver = responseJson['content'] as List;

     

        setState(() {
          isloading = false;
        
        });
      } else {
        setState(() {});
      }
    } catch (e) {
      
      setState(() {});
      // productFromServer = new List();

      // showToast('Something went wrong');
    }
  }
}
