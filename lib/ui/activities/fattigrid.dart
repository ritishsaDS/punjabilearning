import 'package:flutter/material.dart';
import 'package:flutter_punjabilearning/constant/AppColors.dart';
import 'package:flutter_punjabilearning/ui/activities/DashBoardScreen.dart';
import 'package:flutter_punjabilearning/utils/SizeConfig.dart';

class Fattigrid extends StatefulWidget {
  @override
  _FattigridState createState() => _FattigridState();
}

class _FattigridState extends State<Fattigrid> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "ਫੱਟੀ",
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
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
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1.25,
                horizontal: SizeConfig.blockSizeHorizontal * 1.25),
            child: GridView.count(
                crossAxisCount: 5,
                childAspectRatio: 0.80,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 15.0,
                children: List.generate(choices.length, (index) {
                  return Container(
                    child: SelectCard(choice: choices[index]),
                  );
                })),
          )),
    ));
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Container(
        child: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(choice.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 4)),
            Text(choice.punjabi,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 1.5)),
            Text(choice.english,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 1.5)),
          ]),
    ));
  }
}

class Choice {
  const Choice({this.title, this.english, this.punjabi});
  final String title;
  final String english;
  final String punjabi;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'ਓ', english: "Oo’rhaa", punjabi: "ਓੂੜਾ"),
  const Choice(title: 'ਅ', english: "Oo’rhaa", punjabi: "ਓੂੜਾ"),
  const Choice(title: 'ੲ', english: "Oo’rhaa", punjabi: "ਓੂੜਾ"),
  const Choice(title: 'ਸ', english: "Oo’rhaa", punjabi: "ਓੂੜਾ"),
  const Choice(title: 'ਹ', english: "Oo’rhaa", punjabi: "ਓੂੜਾ"),
  const Choice(title: 'ਕ', english: "Oo’rhaa", punjabi: "ਕੱਕਾ"),
  const Choice(title: 'ਖ', english: "khakh’khaa", punjabi: "ਖੱਖਾ"),
  const Choice(title: 'ਗ', english: "gag’gaa", punjabi: "ਗੱਗਾ"),
  const Choice(title: 'ਘ', english: "Oo’rhaa", punjabi: "ਘੱਘਾ"),
  const Choice(title: 'ਙ', english: "Oo’rhaa", punjabi: "ਙੰਙਾ"),
  const Choice(title: 'ਚ', english: "Oo’rhaa", punjabi: "ਚੱਚਾ"),
  const Choice(title: 'ਛ', english: "Oo’rhaa", punjabi: "ਛੱਛਾ"),
  const Choice(title: 'ਜ', english: "Oo’rhaa", punjabi: "ਜੱਜਾ"),
  const Choice(title: 'ਝ', english: "Oo’rhaa", punjabi: "ਝੱਝਾ"),
  const Choice(title: 'ਞ', english: "Oo’rhaa", punjabi: "ਞੰਞਾ"),
  const Choice(title: 'ਟ', english: "tain’kaa", punjabi: "ਟੈਂਕਾ"),
  const Choice(title: 'ਠ', english: "thath’thaa", punjabi: "ਠੱਠਾ"),
  const Choice(title: 'ਡ', english: "ddad’daa", punjabi: "ਡੱਡਾ"),
  const Choice(title: 'ਢ', english: "dhad’daa", punjabi: "ਢੱਢਾ"),
  const Choice(title: 'ਣ', english: "nhaa’nhaa", punjabi: "ਣਾਣਾ"),
  const Choice(title: 'ਤ', english: "tat’taa", punjabi: "ਤੱਤਾ"),
  const Choice(title: 'ਥ', english: "thath’thaa", punjabi: "ਥੱਥਾ"),
  const Choice(title: 'ਦ', english: "dad’daa", punjabi: "ਦੱਦਾ"),
  const Choice(title: 'ਧ', english: "Oo’rhaa", punjabi: "ਧੱਧਾ"),
  const Choice(title: 'ਨ', english: "nan’naa", punjabi: "ਨੱਨਾ"),
  const Choice(title: 'ਪ', english: "pap’paa", punjabi: "ਪੱਪਾ"),
  const Choice(title: 'ਫ', english: "phaph’phaa", punjabi: "ਫੱਫਾ"),
  const Choice(title: 'ਬ', english: "bab’baa", punjabi: "ਬੱਬਾ"),
  const Choice(title: 'ਭ', english: "bhab’baa", punjabi: "ਭੱਭਾ"),
  const Choice(title: 'ਮ', english: "mam’maa", punjabi: "ਮੱਮਾ"),
  const Choice(title: 'ਯ', english: "yay’yaa", punjabi: "ਯੱਯਾ"),
  const Choice(title: 'ਰ', english: "ra’raa", punjabi: "ਰਾਰਾ"),
  const Choice(title: 'ਲ', english: "lal’laa", punjabi: "ਲੱਲਾ"),
  const Choice(title: 'ਵ', english: "vav’vaa", punjabi: "ਵੱਵਾ"),
  const Choice(title: 'ੜ', english: "rhar’rhaa	", punjabi: "ੜਾੜਾ"),
];
