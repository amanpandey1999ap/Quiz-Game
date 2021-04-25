import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/quiz_data.dart';
import 'quiz_screen.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz;

class DifficultyMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async => false,
        child: Scaffold(
      backgroundColor: Color(0xffF1F5FB),
      body: Center(
        child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70.0),
            child: Image.asset('images/app_logo.png'),
          ),
          Container(padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: Text('Welcome to The Quiz Game !',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(bottom: 100.0)),
          Text('Select Difficulty Level',
            style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 5.0, right: 5.0, bottom: 10.0),
                  child: Container(
                    width: 250.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.lightGreenAccent,
                      child: Text('Easy', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      elevation: 20.0,
                      onPressed: (){
                        quiz = new QuizData1();
                        Navigator.push(context, MaterialPageRoute(builder: (context){return Quiz();}));
                      },
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: 250.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.amberAccent,
                      child: Text('Medium', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      elevation: 20.0,
                      onPressed: (){
                        quiz = new QuizData2();
                        Navigator.push(context, MaterialPageRoute(builder: (context){return Quiz();}));
                      },
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: 250.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    child: Text('Hard', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    elevation: 20.0,
                    onPressed: (){
                      quiz = new QuizData3();
                      Navigator.push(context, MaterialPageRoute(builder: (context){return Quiz();}));
                    },
                  ),
                )),
            ],
          )
        ],
      )),
    ));
  }

}